class StockState < ActiveRecord::Base
  belongs_to :product

  named_scope :min_stock_by_product, lambda {|klass|
    {:conditions => ["DATE_FORMAT(state_date, '%Y%m') = :date", {:date => klass[:date]}],
      :group => "product_id"
    }
  }

  def self.find_stock_out date
    klass = {:date => date[:year]+date[:month]}
    stocks = StockState.min_stock_by_product(klass).find(:all)
    preload_product(stocks)
    calculate_purchase_quantity(stocks)
  end

  def self.find_stock_out_for_supplier date
    puts 'find_stock_out_for_supplier'
    klass = {:date => date[:year]+date[:month]}
    stocks = StockState.min_stock_by_product(klass).find(:all)
    preload_product(stocks)
    stocks = calculate_purchase_quantity(stocks)
    devide_stock_out_by_supplier(stocks)
  end

  def self.calculate_purchase_quantity array
    array.inject([]) do |r,el|
      if ((el.forcast-el.product.order_point) < 0)
        el[:purchase_quantity] = el.product.order_point - el.forcast
        el[:product_name] = el.product.product_name
        r << el
      end
      r
    end
  end

  def self.devide_stock_out_by_supplier array
    r = {}
    array.each do |el|
      if(!r.key?(el.product.supplier_id))
        r[el.product.supplier_id] = []
      end
      el[:product_name] = el.product.product_name
      el[:price] = el.product.unit_price * el[:purchase_quantity]
      r[el.product.supplier_id] << el
    end
    return r
  end

  def self.preload_product array
    StockState.send :preload_associations, array, [:product]
  end
end
