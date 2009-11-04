class CreateStockStates < ActiveRecord::Migration
  def self.up
    create_table :stock_states do |t|
      t.date :state_date
      t.integer :product_id
      t.integer :quantity
      t.integer :forcast

      t.timestamps
    end
  end

  def self.down
    drop_table :stock_states
  end
end
