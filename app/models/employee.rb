class Employee < ActiveRecord::Base
  has_many :orders
  has_one :user
end
