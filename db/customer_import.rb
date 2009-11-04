arr = Array.new
Customer.transaction do
  File.open("data/customer.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:customer_name 2:furigana 3:person_in_charge
    c = Customer.new
    c.id = arr[0]
    c.customer_name = arr[1]
    c.furigana = arr[2]
    c.person_in_charge = arr[3]
    c.save
    arr = Array.new
  end
end
