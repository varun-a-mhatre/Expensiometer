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

ActiveRecord::Schema.define(:version => 20110626062656) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category_img_file_name"
    t.string   "category_img_content_type"
    t.integer  "category_img_file_size"
    t.datetime "category_img_updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id",    :default => 1
    t.float    "price",      :default => 1.0
  end

  create_table "presents", :force => true do |t|
    t.integer  "item_id"
    t.integer  "quantity_left"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "calories_per_unit"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_img_file_name"
    t.string   "product_img_content_type"
    t.integer  "product_img_file_size"
    t.datetime "product_img_updated_at"
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shop_img_file_name"
    t.string   "shop_img_content_type"
    t.integer  "shop_img_file_size"
    t.datetime "shop_img_updated_at"
  end

end
