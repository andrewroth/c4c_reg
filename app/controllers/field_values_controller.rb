class FieldValuesController < ApplicationController

  before_filter :load_instances, :except => [:new, :create]


  # GET /events/1/registration/1/field_values
  # GET /events/1/registration/1/field_values.xml
  def index
  end

  # GET /events/1/registration/1/field_values/1
  # GET /events/1/registration/1/field_values/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @field_value }
    end
  end

  # GET /events/1/registration/1/field_values/new
  # GET /events/1/registration/1/field_values/new.xml
  def new
    @field_value = FieldValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @field_value }
    end
  end

  # GET /events/1/registration/1/field_values/1/edit
  def edit
  end

  # POST /events/1/registration/1/field_values
  # POST /events/1/registration/1/field_values.xml
  def create
    @field_value = FieldValue.new(params[:field_value])

    respond_to do |format|
      if @field_value.save
        flash[:notice] = 'FieldValue was successfully created.'
        format.html { redirect_to(@field_value) }
        format.xml  { render :xml => @field_value, :status => :created, :location => @field_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @field_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1/registration/1/field_values/1
  # PUT /events/1/registration/1/field_values/1.xml
  def update
    FieldValue.update(params[:field_value].keys, params[:field_value].values)

    respond_to do |format|
      #if @field_value.update_attributes(params[:field_value])
      if @field_value.update(params[:field_value].keys, params[:field_value].values)
        flash[:notice] = 'FieldValue was successfully updated.'
        format.html { redirect_to(@field_value) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1/registration/1/field_values/1
  # DELETE /events/1/registration/1/field_values/1.xml
  def destroy
    @field_value.destroy

    respond_to do |format|
      format.html { redirect_to(field_values_url) }
      format.xml  { head :ok }
    end
  end


  private

  def load_instances
    @registration = Registration.find(params[:registration_id])
    @event = @registration.event
    @field_values = @registration.field_values
  end

end
