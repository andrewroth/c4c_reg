class FieldValuesController < ApplicationController
  # GET /field_values
  # GET /field_values.xml
  def index
    @field_values = FieldValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @field_values }
    end
  end

  # GET /field_values/1
  # GET /field_values/1.xml
  def show
    @field_value = FieldValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @field_value }
    end
  end

  # GET /field_values/new
  # GET /field_values/new.xml
  def new
    @field_value = FieldValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @field_value }
    end
  end

  # GET /field_values/1/edit
  def edit
    @field_value = FieldValue.find(params[:id])
  end

  # POST /field_values
  # POST /field_values.xml
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

  # PUT /field_values/1
  # PUT /field_values/1.xml
  def update
    @field_value = FieldValue.find(params[:id])

    respond_to do |format|
      if @field_value.update_attributes(params[:field_value])
        flash[:notice] = 'FieldValue was successfully updated.'
        format.html { redirect_to(@field_value) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /field_values/1
  # DELETE /field_values/1.xml
  def destroy
    @field_value = FieldValue.find(params[:id])
    @field_value.destroy

    respond_to do |format|
      format.html { redirect_to(field_values_url) }
      format.xml  { head :ok }
    end
  end
end
