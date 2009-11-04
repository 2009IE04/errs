arr = Array.new
Product.transaction do
  File.open("data/product.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:product_name 2:supplier_id 3:stock 4:order_point
    p = Product.new
    p.id = arr[0]
    p.product_name = arr[1]
    p.supplier_id = arr[2]
    p.stock = arr[3]
    p.order_point = arr[4]
    p.unit_price = arr[5]
    p.save
    arr = Array.new
  end
end
