class CampusesController < ApplicationController

  before_filter :load_instances, :except => [:index, :new, :create]


  # GET /events/1/campuses
  # GET /events/1/campuses.xml
  def index
    @campuses = Campus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campuses }
    end
  end

  # GET /events/1/campuses/1
  # GET /events/1/campuses/1.xml
  def show
    @registrations = @event.registrations_from_campus(@campus)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campus }
    end
  end

  # GET /events/1/campuses/new
  # GET /events/1/campuses/new.xml
  def new
    @campus = Campus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campus }
    end
  end

  # GET events/1/campuses/1/edit
  def edit
  end

  # POST /events/1/campuses
  # POST /events/1/campuses.xml
  def create
    @campus = Campus.new(params[:campus])

    respond_to do |format|
      if @campus.save
        flash[:notice] = 'Campus was successfully created.'
        format.html { redirect_to(@campus) }
        format.xml  { render :xml => @campus, :status => :created, :location => @campus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1/campuses/1
  # PUT /events/1/campuses/1.xml
  def update
    respond_to do |format|
      if @campus.update_attributes(params[:campus])
        flash[:notice] = 'Campus was successfully updated.'
        format.html { redirect_to(@campus) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1/campuses/1
  # DELETE /events/1/campuses/1.xml
  def destroy
    @campus.destroy

    respond_to do |format|
      format.html { redirect_to(campuses_url) }
      format.xml  { head :ok }
    end
  end


  private

  def load_instances
    @event = Event.find(params[:event_id])
    @campus = Campus.find(params[:id])
  end

end

