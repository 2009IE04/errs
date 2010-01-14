class ChargeController < ApplicationController
  def index

    employee_id = User.find(session[:user_id]).employee_id
    @employee = Employee.find(employee_id)

    orders =  @employee.orders
    customer_ids = orders.map{ |order| order.customer.id }.uniq

    conditions = ["id in (?) ", customer_ids]

    if params[:keyword]
      keyword = "%" + params[:keyword] + "%"
      conditions[0] << "and furigana like ? "
      conditions << keyword
    end

    @customers = Customer.find(:all, :conditions => conditions)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def deliverable_list
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
