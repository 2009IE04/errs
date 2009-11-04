class PurchaseDescriptionsController < ApplicationController
  # GET /purchase_descriptions
  # GET /purchase_descriptions.xml
  def index
    @purchase_descriptions = PurchaseDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_descriptions }
    end
  end

  # GET /purchase_descriptions/1
  # GET /purchase_descriptions/1.xml
  def show
    @purchase_description = PurchaseDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_description }
    end
  end

  # GET /purchase_descriptions/new
  # GET /purchase_descriptions/new.xml
  def new
    @purchase_description = PurchaseDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_description }
    end
  end

  # GET /purchase_descriptions/1/edit
  def edit
    @purchase_description = PurchaseDescription.find(params[:id])
  end

  # POST /purchase_descriptions
  # POST /purchase_descriptions.xml
  def create
    @purchase_description = PurchaseDescription.new(params[:purchase_description])

    respond_to do |format|
      if @purchase_description.save
        flash[:notice] = 'PurchaseDescription was successfully created.'
        format.html { redirect_to(@purchase_description) }
        format.xml  { render :xml => @purchase_description, :status => :created, :location => @purchase_description }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_descriptions/1
  # PUT /purchase_descriptions/1.xml
  def update
    @purchase_description = PurchaseDescription.find(params[:id])

    respond_to do |format|
      if @purchase_description.update_attributes(params[:purchase_description])
        flash[:notice] = 'PurchaseDescription was successfully updated.'
        format.html { redirect_to(@purchase_description) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_descriptions/1
  # DELETE /purchase_descriptions/1.xml
  def destroy
    @purchase_description = PurchaseDescription.find(params[:id])
    @purchase_description.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_descriptions_url) }
      format.xml  { head :ok }
    end
  end
end
