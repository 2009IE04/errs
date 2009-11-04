class OrderDescriptionsController < ApplicationController
  # GET /order_descriptions
  # GET /order_descriptions.xml
  def index
    @order_descriptions = OrderDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_descriptions }
    end
  end

  # GET /order_descriptions/1
  # GET /order_descriptions/1.xml
  def show
    @order_description = OrderDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_description }
    end
  end

  # GET /order_descriptions/new
  # GET /order_descriptions/new.xml
  def new
    @order_description = OrderDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_description }
    end
  end

  # GET /order_descriptions/1/edit
  def edit
    @order_description = OrderDescription.find(params[:id])
  end

  # POST /order_descriptions
  # POST /order_descriptions.xml
  def create
    @order_description = OrderDescription.new(params[:order_description])

    respond_to do |format|
      if @order_description.save
        flash[:notice] = 'OrderDescription was successfully created.'
        format.html { redirect_to(@order_description) }
        format.xml  { render :xml => @order_description, :status => :created, :location => @order_description }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_descriptions/1
  # PUT /order_descriptions/1.xml
  def update
    @order_description = OrderDescription.find(params[:id])

    respond_to do |format|
      if @order_description.update_attributes(params[:order_description])
        flash[:notice] = 'OrderDescription was successfully updated.'
        format.html { redirect_to(@order_description) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_descriptions/1
  # DELETE /order_descriptions/1.xml
  def destroy
    @order_description = OrderDescription.find(params[:id])
    @order_description.destroy

    respond_to do |format|
      format.html { redirect_to(order_descriptions_url) }
      format.xml  { head :ok }
    end
  end
end
