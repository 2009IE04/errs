class StockStatesController < ApplicationController
  # GET /stock_states
  # GET /stock_states.xml
  def index
    @products = Product.all
  end

  def search
    start_date = get_time(params[:date][:start_date])
    end_date = get_time(params[:date][:end_date])
    @stock_states = StockState.find(:all, :conditions => ["product_id=? and state_date>=? and state_date<=?", params[:post][:product_id], start_date, end_date])
  end

  # GET /stock_states/1
  # GET /stock_states/1.xml
  def show
    @stock_state = StockState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stock_state }
    end
  end

  # GET /stock_states/new
  # GET /stock_states/new.xml
  def new
    @stock_state = StockState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stock_state }
    end
  end

  # GET /stock_states/1/edit
  def edit
    @stock_state = StockState.find(params[:id])
  end

  # POST /stock_states
  # POST /stock_states.xml
  def create
    @stock_state = StockState.new(params[:stock_state])

    respond_to do |format|
      if @stock_state.save
        flash[:notice] = 'StockState was successfully created.'
        format.html { redirect_to(@stock_state) }
        format.xml  { render :xml => @stock_state, :status => :created, :location => @stock_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stock_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stock_states/1
  # PUT /stock_states/1.xml
  def update
    @stock_state = StockState.find(params[:id])

    respond_to do |format|
      if @stock_state.update_attributes(params[:stock_state])
        flash[:notice] = 'StockState was successfully updated.'
        format.html { redirect_to(@stock_state) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stock_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_states/1
  # DELETE /stock_states/1.xml
  def destroy
    @stock_state = StockState.find(params[:id])
    @stock_state.destroy

    respond_to do |format|
      format.html { redirect_to(stock_states_url) }
      format.xml  { head :ok }
    end
  end

  private
  def get_time(date_params)
    year = date_params.split("-")[0]
    month = date_params.split("-")[1]
    day = date_params.split("-")[2]
    Time.mktime(year,month,day)
#    Time.mktime(date_params[:year],date_params[:month],date_params[:day])
  end
end
