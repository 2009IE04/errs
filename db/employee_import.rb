arr = Array.new
Employee.transaction do
  File.open("data/employee.csv").each_line do |line|
    line = line.strip
    arr = line.split(",")
    #0:id 1:employee_name 2+3:department_name 4:id(password)
    e = Employee.new
    e.id = arr[0]
    e.employee_name = arr[1]
    e.department_name = arr[2].to_s + '/' + arr[3].to_s
    e.password = arr[0]
    e.save
    arr = Array.new
  end
end
