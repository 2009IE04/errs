arr = Array.new
Order.transaction do
  File.open("data/order.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:customer_id 2:employee_id 3:customer_name 4:order_date 5:shipping_date
    o = Order.new
    o.id = arr[0]
    o.customer_id = arr[1]
    o.employee_id = arr[2]
    o.customer_name = arr[3]
    o.order_date = DateTime.parse(arr[4]).to_date
    o.shipping_date = DateTime.parse(arr[5]).to_date
    o.save
    arr = Array.new
  end
end
