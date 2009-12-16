class PriceRulesController < ApplicationController
  # GET /price_rules
  # GET /price_rules.xml
  def index
    @price_rules = PriceRule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @price_rules }
    end
  end

  # GET /price_rules/1
  # GET /price_rules/1.xml
  def show
    @price_rule = PriceRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price_rule }
    end
  end

  # GET /price_rules/new
  # GET /price_rules/new.xml
  def new
    @price_rule = PriceRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price_rule }
    end
  end

  # GET /price_rules/1/edit
  def edit
    @price_rule = PriceRule.find(params[:id])
  end

  # POST /price_rules
  # POST /price_rules.xml
  def create
    @price_rule = PriceRule.new(params[:price_rule])

    respond_to do |format|
      if @price_rule.save
        flash[:notice] = 'PriceRule was successfully created.'
        format.html { redirect_to(@price_rule) }
        format.xml  { render :xml => @price_rule, :status => :created, :location => @price_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /price_rules/1
  # PUT /price_rules/1.xml
  def update
    @price_rule = PriceRule.find(params[:id])

    respond_to do |format|
      if @price_rule.update_attributes(params[:price_rule])
        flash[:notice] = 'PriceRule was successfully updated.'
        format.html { redirect_to(@price_rule) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /price_rules/1
  # DELETE /price_rules/1.xml
  def destroy
    @price_rule = PriceRule.find(params[:id])
    @price_rule.destroy

    respond_to do |format|
      format.html { redirect_to(price_rules_url) }
      format.xml  { head :ok }
    end
  end
end
