class AddSupplierAddress < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :post_code, :string
    add_column :suppliers, :prefecture, :string
    add_column :suppliers, :address1, :string
    add_column :suppliers, :address2, :string
    add_column :suppliers, :fax, :string
  end

  def self.down
    remove_column(:suppliers, :post_code, :prefecture, :address1, :address2, :fax)
  end
end
