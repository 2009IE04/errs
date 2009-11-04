arr = Array.new
PurchaseDescription.transaction do
  File.open("data/Purchases_description.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:supplier_id 2:purchase_date 3:arrival_date
    p = PurchaseDescription.new
    p.purchase_id = arr[0]
    p.product_id = arr[1]
    p.quantity = arr[2]
    p.save
    arr = Array.new
  end
end
