class ScholarshipsController < ApplicationController
  # GET /scholarships
  # GET /scholarships.xml
  def index
    @scholarships = Scholarship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scholarships }
    end
  end

  # GET /scholarships/1
  # GET /scholarships/1.xml
  def show
    @scholarship = Scholarship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scholarship }
    end
  end

  # GET /scholarships/new
  # GET /scholarships/new.xml
  def new
    @scholarship = Scholarship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scholarship }
    end
  end

  # GET /scholarships/1/edit
  def edit
    @scholarship = Scholarship.find(params[:id])
  end

  # POST /scholarships
  # POST /scholarships.xml
  def create
    @scholarship = Scholarship.new(params[:scholarship])

    respond_to do |format|
      if @scholarship.save
        flash[:notice] = 'Scholarship was successfully created.'
        format.html { redirect_to(@scholarship) }
        format.xml  { render :xml => @scholarship, :status => :created, :location => @scholarship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scholarship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scholarships/1
  # PUT /scholarships/1.xml
  def update
    @scholarship = Scholarship.find(params[:id])

    respond_to do |format|
      if @scholarship.update_attributes(params[:scholarship])
        flash[:notice] = 'Scholarship was successfully updated.'
        format.html { redirect_to(@scholarship) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scholarship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarships/1
  # DELETE /scholarships/1.xml
  def destroy
    @scholarship = Scholarship.find(params[:id])
    @scholarship.destroy

    respond_to do |format|
      format.html { redirect_to(scholarships_url) }
      format.xml  { head :ok }
    end
  end
end
