class ScholarshipsController < ApplicationController


  before_filter :load_instances, :except => [:index, :new, :create]
  

  # GET /events/1/registration/1/scholarships
  # GET /events/1/registration/1/scholarships.xml
  def index
    @scholarships = Scholarship.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scholarships }
    end
  end

  # GET /events/1/registration/1/scholarships/1
  # GET /events/1/registration/1/scholarships/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scholarship }
    end
  end

  # GET /events/1/registration/1/scholarships/new
  # GET /events/1/registration/1/scholarships/new.xml
  def new
    @registration = Registration.find(params[:registration_id])
    @event = @registration.event
    @scholarship = @registration.scholarships.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scholarship }
    end
  end

  # GET /events/1/registration/1/scholarships/1/edit
  def edit
  end

  # POST /events/1/registration/1/scholarships
  # POST /events/1/registration/1/scholarships.xml
  def create
    @registration = Registration.find(params[:registration_id])
    @event = @registration.event
    @scholarship = Scholarship.new(params[:scholarship])

    respond_to do |format|
      if @scholarship.save
        flash[:notice] = 'Scholarship was successfully created.'
        format.html { redirect_back(url_for([@event, @registration, @scholarship])) }
        format.xml  { render :xml => @scholarship, :status => :created, :location => @scholarship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scholarship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1/registration/1/scholarships/1
  # PUT /events/1/registration/1/scholarships/1.xml
  def update
    respond_to do |format|
      if @scholarship.update_attributes(params[:scholarship])
        flash[:notice] = 'Scholarship was successfully updated.'
        format.html { redirect_back(url_for([@event, @registration, @scholarship])) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scholarship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1/registration/1/scholarships/1
  # DELETE /events/1/registration/1/scholarships/1.xml
  def destroy
    @scholarship.destroy

    respond_to do |format|
      flash[:notice] = 'Scholarship was deleted.'
      format.html { redirect_back(event_registration_scholarships_path) }
      format.xml  { head :ok }
    end
  end


  private

  def load_instances
    @scholarship = Scholarship.find(params[:id])
    @registration = @scholarship.registration
    @event = @registration.event
  end
end
