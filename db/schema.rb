# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120513171341) do

  create_table "addresses", :force => true do |t|
    t.string   "title",        :limit => 50
    t.integer  "customer_id"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.string   "country_code"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.float    "price"
    t.integer  "quantity"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "menu_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cuisines", :force => true do |t|
    t.string   "name",       :limit => 75
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "ingredient_categorizations", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "item_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.integer  "provider_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "provider_id"
    t.string   "name"
    t.float    "price"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "menus", :force => true do |t|
    t.integer  "provider_id"
    t.string   "name"
    t.string   "photo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.string   "country_code"
    t.string   "phone"
    t.string   "email"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "provider_id"
  end

  create_table "order_item_ingredients", :force => true do |t|
    t.integer  "order_item_id"
    t.integer  "ingredient_id"
    t.float    "price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.float    "price"
    t.integer  "quantity"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "delivery_address_id"
    t.string   "status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "provider_cuisines", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "cuisine_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
  end

  add_index "providers", ["slug"], :name => "index_providers_on_slug"

end
