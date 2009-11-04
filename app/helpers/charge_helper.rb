module ChargeHelper

  def  deliverable_link_to customer, employee
    link_to "#{customer.customer_name}", { :controller => 'deliverable', :action => 'index', :customer_id => customer.id, :employee_id => employee.id }
  end

  def deliverable_state stock_state
    if stock_state
      if stock_state.forcast >= 0
        return "○"
      else
        return "×"
      end
    else
      return "在庫わかんない"
    end
  end
end
