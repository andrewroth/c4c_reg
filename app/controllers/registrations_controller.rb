class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end


  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
    @event ||= Event.find(params[:event_id])
    @registration_statuses = RegistrationStatus.get_all_statuses("description", "ASC").map { |s| [s.description, s.id] }

    @price_info = {}
    @price_info[:rules] = @registration.get_applicable_rules()
    @price_info[:base_price] = @registration.get_base_price_from_rules(@price_info[:rules])
    
    @price_info[:total_cash_paid] = @registration.get_total_cash_paid()
    @price_info[:total_cash_owed] = @registration.get_total_cash_owed()

    @price_info[:total_scholarship_worth] = @registration.get_total_scholarship()

    @price_info[:amount_paid] = @price_info[:total_cash_paid].to_f + @price_info[:total_scholarship_worth].to_f
    @price_info[:balance_owed] = @price_info[:base_price].to_f - @price_info[:amount_paid].to_f

    @scholarships = @registration.scholarships
    @cash_transactions = @registration.cash_transactions

    @event_fields = @registration.get_event_field()

  #rescue
    #logger.error "EXCEPTION when loading registration with id #{params[:id]}"
    #flash[:notice] = "Could not load registration information!"
    #redirect_to :back
  end


  # POST /registrations
  # POST /registrations.xml
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


  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

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

  
  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end
end
