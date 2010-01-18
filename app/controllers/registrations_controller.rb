class RegistrationsController < ApplicationController

  before_filter :load_instances, :except => [:index, :new, :create]


  # GET /events/1/registrations
  # GET /events/1/registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /events/1/registrations/1
  # GET /events/1/registrations/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /events/1/registrations/new
  # GET /events/1/registrations/new.xml
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end


  # GET /events/1/registrations/1/edit
  def edit
    @event = @registration.event
    @person = @registration.person
    @campus = @person.get_best_assigned_campus()
    
    @registration_statuses = RegistrationStatus.get_all_statuses("description", "ASC").map { |s| [s.description, s.id] }

    @price_info = {}
    @price_info[:rules] = @registration.get_applicable_rules()
    @price_info[:base_price] = @registration.get_base_price_from_rules(@price_info[:rules])
    @price_info[:regular_base_price] = @registration.get_regular_base_price()
    
    @price_info[:total_cash_paid] = @registration.get_total_cash_paid()
    @price_info[:total_cash_owed] = @registration.get_total_cash_owed()

    @price_info[:total_scholarship_worth] = @registration.get_total_scholarship()

    @price_info[:amount_paid] = @price_info[:total_cash_paid].to_f + @price_info[:total_scholarship_worth].to_f
    @price_info[:balance_owed] = @price_info[:base_price].to_f - @price_info[:amount_paid].to_f

    @scholarships = @registration.scholarships
    @cash_transactions = @registration.cash_transactions

    @has_cash_transactions = @cash_transactions.size > 0 ? true : false
    @has_scholarships = @scholarships.size > 0 ? true : false

    @field_values = @registration.field_values
    @has_fields = @field_values.size > 0 ? true : false
    
  #rescue
    #logger.error "EXCEPTION when loading registration with id #{params[:id]}"
    #flash[:notice] = "Could not load registration information!"
    #redirect_to :back
  end


  # POST /events/1/registrations
  # POST /events/1/registrations.xml
  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        flash[:notice] = 'Registration was successfully created.'
        format.html { redirect_to(@registration) }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /events/1/registrations/1
  # PUT /events/1/registrations/1.xml
  def update
    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        flash[:notice] = 'Registration was successfully updated.'
        format.html { redirect_to :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  # DELETE /events/1/registrations/1
  # DELETE /events/1/registrations/1.xml
  def destroy
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end


  private

  def load_instances
    @registration = Registration.find(params[:id])
  end
end
