class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :employee
  has_many :order_descriptions
end
