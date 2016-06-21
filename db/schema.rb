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

ActiveRecord::Schema.define(version: 20160620203809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "description"
    t.string   "current_city"
    t.integer  "age"
    t.string   "profile_pic"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "phone_number"
    t.string   "email"
    t.string   "description"
    t.string   "profile_pic"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree
  add_index "visits", ["venue_id"], name: "index_visits_on_venue_id", using: :btree

  add_foreign_key "visits", "users"
  add_foreign_key "visits", "venues"
end
