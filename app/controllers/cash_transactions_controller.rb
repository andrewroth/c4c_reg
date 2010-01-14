class CashTransactionsController < ApplicationController
  # GET /cash_transactions
  # GET /cash_transactions.xml
  def index
    @cash_transactions = CashTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cash_transactions }
    end
  end

  # GET /cash_transactions/1
  # GET /cash_transactions/1.xml
  def show
    @cash_transaction = CashTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cash_transaction }
    end
  end

  # GET /cash_transactions/new
  # GET /cash_transactions/new.xml
  def new
    @registration = Registration.find(params[:registration_id])
    @event = Event.find(params[:event_id])
    @cash_transaction = @registration.cash_transactions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cash_transaction }
    end
  end

  # GET /cash_transactions/1/edit
  def edit
    @registration = Registration.find(params[:registration_id])
    @event = Event.find(params[:event_id])
    @cash_transaction = CashTransaction.find(params[:id])
  end

  # POST /cash_transactions
  # POST /cash_transactions.xml
  def create
    @registration = Registration.find(params[:registration_id])
    @event = Event.find(params[:event_id])
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

  # PUT /cash_transactions/1
  # PUT /cash_transactions/1.xml
  def update
    @registration = Registration.find(params[:registration_id])
    @event = Event.find(params[:event_id])
    @cash_transaction = CashTransaction.find(params[:id])

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

  # DELETE /cash_transactions/1
  # DELETE /cash_transactions/1.xml
  def destroy
    @cash_transaction = CashTransaction.find(params[:id])
    @cash_transaction.destroy

    respond_to do |format|
      flash[:notice] = 'Cash transaction was deleted.'
      format.html { redirect_back(event_registration_cash_transactions_path) }
      format.xml  { head :ok }
    end
  end
end
