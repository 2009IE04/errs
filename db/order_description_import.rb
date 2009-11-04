arr = Array.new
OrderDescription.transaction do
  File.open("data/order_description.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:order_id 1:product_id 2:quantity
    o = OrderDescription.new
    o.order_id = arr[0]
    o.product_id = arr[1]
    o.quantity = arr[2]
    o.save
    arr = Array.new
  end
end
