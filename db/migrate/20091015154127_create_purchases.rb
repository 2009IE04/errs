class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :supplier_id
      t.date :purchase_date
      t.date :arrival_date

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
