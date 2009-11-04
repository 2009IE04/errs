class LoginsController < ApplicationController
  # GET /logins
  # GET /logins.xml
  def index

    employee = Employee.find_by_id(params[:employee_id])
    if employee
      redirect_to :controller => :charge, :action => :index, :employee_id => employee.id
    else
      render :action => :index
    end
  end

end
