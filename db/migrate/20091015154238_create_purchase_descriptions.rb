class CreatePurchaseDescriptions < ActiveRecord::Migration
  def self.up
    create_table :purchase_descriptions do |t|
      t.integer :purchase_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_descriptions
  end
end
