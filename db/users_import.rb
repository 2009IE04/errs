Employee.all.each do |employee|
  employee.user = User.new(:password => "password")
  employee.user.encrypt_password
  employee.save
end