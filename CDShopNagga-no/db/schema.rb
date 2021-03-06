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

ActiveRecord::Schema.define(version: 2019_05_27_092344) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ship_to_another_id"
    t.integer "payment"
    t.integer "total_price"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_to_another_id"], name: "index_carts_on_ship_to_another_id"
    t.index ["updated_at"], name: "index_carts_on_updated_at"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["created_at"], name: "index_contacts_on_created_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "favorite_id"
    t.integer "item_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_name"], name: "index_genres_on_genre_name"
  end

  create_table "item_carts", force: :cascade do |t|
    t.integer "item_id"
    t.integer "cart_id"
    t.integer "item_count"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_item_carts_on_cart_id"
    t.index ["item_id"], name: "index_item_carts_on_item_id"
  end

  create_table "item_genres", force: :cascade do |t|
    t.integer "item_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_item_genres_on_genre_id"
  end

  create_table "item_singers", force: :cascade do |t|
    t.integer "item_id"
    t.integer "singer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil, "singer_id"], name: "index_item_singers_on_item_singer_id_and_singer_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "label_id"
    t.string "item_name"
    t.string "image_id"
    t.integer "price"
    t.text "description"
    t.integer "active", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_name"], name: "index_items_on_item_name"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_name"], name: "index_labels_on_label_name"
  end

  create_table "respons", force: :cascade do |t|
    t.integer "contact_id"
    t.string "respon_name"
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_reviews_on_review_id"
  end

  create_table "ship_to_anothers", force: :cascade do |t|
    t.string "first_name", limit: 20, null: false
    t.string "last_name", limit: 20, null: false
    t.string "first_name_kana", limit: 20, null: false
    t.string "last_name_kana", limit: 20, null: false
    t.string "postal_code", limit: 7, null: false
    t.string "address", limit: 300, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "singers", force: :cascade do |t|
    t.integer "singer_id"
    t.string "singer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "item_id"
    t.string "song_name"
    t.string "disk"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disk", "number"], name: "index_songs_on_disk_and_number"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock_count"
    t.index ["updated_at"], name: "index_stocks_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "user_id"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "postal_code"
    t.string "addres"
    t.string "phone_number"
    t.boolean "admin", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
