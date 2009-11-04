class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :customer_name
      t.string :furigana
      t.string :person_in_charge

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
