class DeliverableController < ApplicationController
  # GET /deliverable
  # GET /deliverable.xml
  def index

    @employee = Employee.find(params[:employee_id])
    @customer = Customer.find(params[:customer_id])
    orders =  Order.find_all_by_customer_id_and_employee_id(params[:customer_id],params[:employee_id])
    order_ids = orders.map{ |order| order.id }

    conditions = ["id in (?) ", order_ids]
    @products = Product.find(:all, :conditions => ["order_descriptions.id in (?) ", order_ids], :include => [ :stock_states, :order_descriptions], :order => "state_date desc" )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

end
