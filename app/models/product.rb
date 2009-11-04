class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :order_descriptions
  has_many :purchase_descriptions
  has_many :stock_states
end
