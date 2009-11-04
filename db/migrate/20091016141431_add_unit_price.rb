class AddUnitPrice < ActiveRecord::Migration
  def self.up
    add_column :products, :unit_price, :integer
  end

  def self.down
    remove_column(:products, :unit_price)
  end
end
