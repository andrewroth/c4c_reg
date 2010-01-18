class CashTransactionsController < ApplicationController

  before_filter :load_instances, :except => [:index, :new, :create]


  # GET /events/1/registration/1/cash_transactions
  # GET /events/1/registration/1/cash_transactions.xml
  def index
    @cash_transactions = CashTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cash_transactions }
    end
  end

  # GET /events/1/registration/1/cash_transactions/1
  # GET /events/1/registration/1/cash_transactions/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cash_transaction }
    end
  end

  # GET /events/1/registration/1/cash_transactions/new
  # GET /events/1/registration/1/cash_transactions/new.xml
  def new
    @registration = Registration.find(params[:registration_id])
    @event = @registration.event
    @cash_transaction = @registration.cash_transactions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cash_transaction }
    end
  end

  # GET /events/1/registration/1/cash_transactions/1/edit
  def edit
  end

  # POST /events/1/registration/1/cash_transactions
  # POST /events/1/registration/1/cash_transactions.xml
  def create
    @registration = Registration.find(params[:registration_id])
    @event = @registration.event
    @cash_transaction = CashTransaction.new(params[:cash_transaction])

    respond_to do |format|
      if @cash_transaction.save
        flash[:notice] = 'Cash transaction was successfully created.'
        format.html { redirect_back(url_for([@event, @registration, @cash_transaction])) }
        format.xml  { render :xml => @cash_transaction, :status => :created, :location => @cash_transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cash_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1/registration/1/cash_transactions/1
  # PUT /events/1/registration/1/cash_transactions/1.xml
  def update
    respond_to do |format|
      if @cash_transaction.update_attributes(params[:cash_transaction])
        flash[:notice] = 'Cash transaction was successfully updated.'
        format.html { redirect_back(url_for([@event, @registration, @cash_transaction])) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cash_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1/registration/1/cash_transactions/1
  # DELETE /events/1/registration/1/cash_transactions/1.xml
  def destroy
    @cash_transaction.destroy

    respond_to do |format|
      flash[:notice] = 'Cash transaction was deleted.'
      format.html { redirect_back(event_registration_cash_transactions_path) }
      format.xml  { head :ok }
    end
  end


  private

  def load_instances
    @cash_transaction = CashTransaction.find(params[:id])
    @registration = @cash_transaction.registration
    @event = @registration.event
  end

end
