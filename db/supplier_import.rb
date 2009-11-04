arr = Array.new
Supplier.transaction do
  File.open("data/supplier.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:supplier_name
    s = Supplier.new
    s.id = arr[0]
    s.supplier_name = arr[1]
    s.post_code = arr[2]
    s.prefecture = arr[3]
    s.address1 = arr[4]
    s.address2 = arr[5]
    s.fax = arr[6]
    s.save
    arr = Array.new
  end
end
