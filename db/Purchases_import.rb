arr = Array.new
Purchase.transaction do
  File.open("data/Purchases.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:supplier_id 2:purchase_date 3:arrival_date
    p = Purchase.new
    p.id = arr[0]
    p.supplier_id = arr[1]
    p.purchase_date = DateTime.parse(arr[2]).to_date
    p.arrival_date = DateTime.parse(arr[3]).to_date
    p.save
    arr = Array.new
  end
end
