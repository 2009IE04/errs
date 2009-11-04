class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :employee_name
      t.string :department_name
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
