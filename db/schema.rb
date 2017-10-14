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

ActiveRecord::Schema.define(version: 20171014203329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "market_id"
    t.text "product_index"
    t.text "product_show"
    t.text "forum_index"
    t.text "forum_show"
    t.text "account_profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "product_new"
    t.text "forum_new"
    t.index ["market_id"], name: "index_banners_on_market_id"
    t.index ["user_id"], name: "index_banners_on_user_id"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "market_id"
  end

  create_table "flags", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_flags_on_product_id"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "forum_categories", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_name"
    t.index ["market_id"], name: "index_forum_categories_on_market_id"
    t.index ["user_id"], name: "index_forum_categories_on_user_id"
  end

  create_table "forum_posts", id: :serial, force: :cascade do |t|
    t.integer "forum_thread_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "images", default: [], array: true
  end

  create_table "forum_threads", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "post_count"
    t.integer "forum_category_id"
    t.integer "market_id"
    t.index ["deleted_at"], name: "index_forum_threads_on_deleted_at"
    t.index ["forum_category_id"], name: "index_forum_threads_on_forum_category_id"
    t.index ["market_id"], name: "index_forum_threads_on_market_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "market_id"
    t.index ["market_id"], name: "index_groups_on_market_id"
  end

  create_table "markets", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "store_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.text "subdomain"
    t.string "first_color"
    t.string "second_color"
    t.string "email_address_type"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_markets_on_group_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expire_date"
    t.integer "view_count"
    t.integer "contact_count"
    t.integer "category_id"
    t.integer "market_id"
    t.integer "user_id"
    t.text "images", default: [], array: true
    t.integer "contact_pref"
    t.boolean "contact_by_email", default: true
    t.boolean "contact_by_phone", default: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["market_id"], name: "index_products_on_market_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "is_advertiser", default: false
    t.boolean "is_mod", default: false
    t.integer "market_id"
    t.text "images"
    t.integer "is_flagged"
    t.boolean "admin", default: false
    t.string "username"
    t.string "phone_number"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["market_id"], name: "index_users_on_market_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "banners", "markets"
  add_foreign_key "banners", "users"
  add_foreign_key "flags", "products"
  add_foreign_key "flags", "users"
  add_foreign_key "forum_categories", "markets"
  add_foreign_key "forum_categories", "users"
  add_foreign_key "forum_threads", "forum_categories"
  add_foreign_key "forum_threads", "markets"
  add_foreign_key "groups", "markets"
  add_foreign_key "markets", "groups"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "markets"
  add_foreign_key "products", "users"
  add_foreign_key "users", "markets"
end
