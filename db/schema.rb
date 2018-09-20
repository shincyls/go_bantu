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

ActiveRecord::Schema.define(version: 2018_09_20_060752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dresses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "category_id"
    t.string "remark"
    t.string "color"
    t.float "price"
    t.integer "stock"
    t.float "cm_length"
    t.float "cm_bust"
    t.float "cm_waist"
    t.float "cm_hip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.index ["category_id"], name: "index_dresses_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "birthday"
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "role", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

end
