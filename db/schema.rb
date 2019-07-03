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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_03_034159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_products_on_category_id"
    t.index ["product_id"], name: "index_category_products_on_product_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "number"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "images"
    t.integer "price"
    t.bigint "shop_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_account_id"], name: "index_products_on_shop_account_id"
  end

  create_table "shop_accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shop_name"
    t.string "phone"
    t.string "address"
    t.string "desc"
    t.string "tax_code"
    t.index ["email"], name: "index_shop_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shop_accounts_on_reset_password_token", unique: true
    t.index ["shop_name"], name: "index_shop_accounts_on_shop_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "phone"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "category_products", "categories"
  add_foreign_key "category_products", "products"
  add_foreign_key "products", "shop_accounts"
end
