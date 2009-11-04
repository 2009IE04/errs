require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :coding => 'utf8',
  :host => 'localhost',
  :username => 'root',
  :password => 'root',
  :database => 'errs_base'
)

class Order < ActiveRecord::Base
  has_many :order_descriptions
end

class OrderDescription < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
end

class Product < ActiveRecord::Base
  has_many :order_descriptions
  has_many :purchase_descriptions
  has_many :stock_states, :order => "state_date"
end

class Purchase < ActiveRecord::Base
  has_many :purchase_desctiptions
end

class PurchaseDescription < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :product
end

class StockState < ActiveRecord::Base
  belongs_to :product
end

StockState.delete_all

pus = PurchaseDescription.find(:all, :joins => [:purchase,:product], :order => 'product_id,arrival_date')

countPs = 0

StockState.transaction do
  pus.each do |pu|
    StockState.new(
      :state_date => pu.purchase.arrival_date,
      :quantity => "#{pu.quantity}".to_i,
      :product_id => pu.product_id).save
    countPs += 1
    #puts "#{countPs +=1},#{pu.product_id},#{pu.purchase.arrival_date},#{pu.quantity}"
  end
  puts "PUS: #{countPs}record inserted."
end
puts PurchaseDescription.count

ods = OrderDescription.find(:all,
                            :joins => [:order,:product],
                            :order => 'product_id,shipping_date')

countOs = 0
StockState.transaction do
  ods.each do |od|
    StockState.new(
      :state_date => od.order.shipping_date,
      :quantity => "-#{od.quantity}".to_i,
      :product_id => od.product_id).save
    countOs += 1
    #puts "#{countOs +=1},#{od.product_id},#{od.order.shipping_date},-#{od.quantity}"
  end
  puts "ODS: #{countOs}record inserted."
end
puts OrderDescription.count

StockState.transaction do
  StockState.find(:all,:select =>"distinct product_id").each do |s| 
    p = s.product
    proc_stock = p.stock
    p.stock_states.each do |s|
      s.forcast = proc_stock + s.quantity
      s.save
      proc_stock = s.forcast 
    end
  end
end
