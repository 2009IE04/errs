class AddMailAddressToSupplier < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :mail_address, :string
  end

  def self.down
    remove_column :suppliers, :mail_address
  end
end
