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

ActiveRecord::Schema.define(version: 20170922053458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "market_id"
  end

  create_table "forum_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "market_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "forum_categories", ["category_id"], name: "index_forum_categories_on_category_id", using: :btree
  add_index "forum_categories", ["market_id"], name: "index_forum_categories_on_market_id", using: :btree
  add_index "forum_categories", ["user_id"], name: "index_forum_categories_on_user_id", using: :btree

  create_table "forum_posts", force: :cascade do |t|
    t.integer  "forum_thread_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "images",          default: [],              array: true
  end

  create_table "forum_threads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer  "view_count"
    t.integer  "post_count"
    t.text     "image_data"
  end

  add_index "forum_threads", ["deleted_at"], name: "index_forum_threads_on_deleted_at", using: :btree

  create_table "markets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "image_data"
    t.text     "subdomain"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "expire_date"
    t.integer  "view_count"
    t.integer  "contact_count"
    t.integer  "category_id"
    t.integer  "market_id"
    t.integer  "user_id"
    t.text     "images",        default: [],              array: true
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["market_id"], name: "index_products_on_market_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_advertiser",          default: false
    t.boolean  "is_mod",                 default: false
    t.integer  "market_id"
    t.text     "images"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["market_id"], name: "index_users_on_market_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "forum_categories", "categories"
  add_foreign_key "forum_categories", "markets"
  add_foreign_key "forum_categories", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "markets"
  add_foreign_key "products", "users"
  add_foreign_key "users", "markets"
end
