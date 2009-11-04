class Employee < ActiveRecord::Base
  has_many :orders
end
