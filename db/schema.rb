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

ActiveRecord::Schema.define(version: 20180419005550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.string "name", default: "FinFriend"
    t.text "description", default: "With 3 percent cash back on all purchases, this is the best single credit card there is!"
    t.decimal "apr", precision: 10, scale: 2, default: "0.35"
    t.decimal "limit", precision: 10, scale: 2, default: "1000.0"
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.decimal "accrued_interest", precision: 10, scale: 2, default: "0.0"
    t.decimal "payments", precision: 10, scale: 2, default: "0.0"
    t.decimal "charges", precision: 10, scale: 2, default: "0.0"
    t.datetime "created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_credit_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "credit_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
