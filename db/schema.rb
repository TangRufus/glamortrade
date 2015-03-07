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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150307021049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false, null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "company_id",  null: false
    t.integer  "amount",      null: false
    t.text     "description", null: false
    t.string   "title",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bills", ["company_id"], name: "index_bills_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "domain_url",                 null: false
    t.string   "low_stock_contact_email"
    t.string   "out_of_stock_contact_email"
    t.string   "delivery_contact_email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "commission_rate"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "unit",              null: false
    t.integer  "amount",            null: false
    t.integer  "variant_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "commission_charge", null: false
    t.string   "status"
  end

  add_index "orders", ["variant_id"], name: "index_orders_on_variant_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.text     "description"
    t.integer  "commission_rate"
    t.string   "name",            null: false
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ads_budget"
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "variants", force: :cascade do |t|
    t.string   "your_sku"
    t.integer  "minimum_price",   null: false
    t.integer  "commission_rate"
    t.string   "name",            null: false
    t.integer  "product_id"
    t.integer  "inventory",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "our_sku"
  end

  add_index "variants", ["our_sku"], name: "index_variants_on_our_sku", using: :btree
  add_index "variants", ["product_id"], name: "index_variants_on_product_id", using: :btree

  add_foreign_key "bills", "companies"
  add_foreign_key "orders", "variants"
  add_foreign_key "products", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "variants", "products"
end
