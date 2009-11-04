class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :employee_id
      t.string :customer_name
      t.date :order_date
      t.date :shipping_date

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
