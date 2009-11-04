# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091016184532) do

  create_table "customers", :force => true do |t|
    t.string   "customer_name"
    t.string   "furigana"
    t.string   "person_in_charge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "employee_name"
    t.string   "department_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_descriptions", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.string   "customer_name"
    t.date     "order_date"
    t.date     "shipping_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.integer  "supplier_id"
    t.integer  "stock"
    t.integer  "order_point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_price"
  end

  create_table "purchase_descriptions", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "supplier_id"
    t.date     "purchase_date"
    t.date     "arrival_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_states", :force => true do |t|
    t.date     "state_date"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "forcast"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "supplier_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "post_code"
    t.string   "prefecture"
    t.string   "address1"
    t.string   "address2"
    t.string   "fax"
  end

end
