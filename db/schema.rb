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

ActiveRecord::Schema.define(version: 2018_09_27_042047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donor_id"
    t.bigint "project_id"
    t.float "amount"
    t.boolean "anonymous", default: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["project_id"], name: "index_donations_on_project_id"
  end

  create_table "donors", force: :cascade do |t|
    t.bigint "user_id"
    t.string "place_holder1"
    t.string "place_holder2"
    t.string "place_holder3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_donors_on_user_id"
  end

  create_table "organizer_project_joins", force: :cascade do |t|
    t.bigint "organizer_id"
    t.bigint "project_id"
    t.integer "status"
    t.string "remarks"
    t.string "admin_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_organizer_project_joins_on_organizer_id"
    t.index ["project_id"], name: "index_organizer_project_joins_on_project_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company_name"
    t.string "email"
    t.string "description"
    t.string "phone_number1"
    t.string "phone_number2"
    t.integer "type"
    t.string "website_link"
    t.string "facebook_link"
    t.string "instagram_link"
    t.string "twitter_link"
    t.string "linkedin_link"
    t.string "address_1", limit: 32
    t.string "address_2", limit: 32
    t.string "postcode", limit: 5
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizers_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_category_joins", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "category_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_project_category_joins_on_category_id"
    t.index ["project_id"], name: "index_project_category_joins_on_project_id"
  end

  create_table "project_cause_joins", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "cause_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_project_cause_joins_on_cause_id"
    t.index ["project_id"], name: "index_project_cause_joins_on_project_id"
  end

  create_table "project_profession_joins", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "profession_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_id"], name: "index_project_profession_joins_on_profession_id"
    t.index ["project_id"], name: "index_project_profession_joins_on_project_id"
  end

  create_table "project_skill_joins", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "skill_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_skill_joins_on_project_id"
    t.index ["skill_id"], name: "index_project_skill_joins_on_skill_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", limit: 128
    t.text "project_desc"
    t.text "requirement_desc"
    t.string "contact_person_1"
    t.string "contact_number_1"
    t.string "contact_person_2"
    t.string "contact_number_2"
    t.string "address_1", limit: 64
    t.string "address_2", limit: 64
    t.string "postcode", limit: 5
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.date "start_date", default: "2018-01-01"
    t.date "end_date", default: "2020-12-31"
    t.integer "status", default: 0
    t.integer "volunteer_number", default: 0
    t.float "fund_amount", default: 0.0
    t.boolean "volunteer", default: true
    t.boolean "finance_donate", default: true
    t.boolean "material_donate", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", limit: 32
    t.string "last_name", limit: 64
    t.string "phone_number", limit: 16
    t.date "birthday"
    t.string "address_1", limit: 64
    t.string "address_2", limit: 64
    t.string "postcode", limit: 5
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.integer "role", default: 1
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "volunteer_cause_joins", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.bigint "cause_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_volunteer_cause_joins_on_cause_id"
    t.index ["volunteer_id"], name: "index_volunteer_cause_joins_on_volunteer_id"
  end

  create_table "volunteer_profession_joins", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.bigint "profession_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_id"], name: "index_volunteer_profession_joins_on_profession_id"
    t.index ["volunteer_id"], name: "index_volunteer_profession_joins_on_volunteer_id"
  end

  create_table "volunteer_project_joins", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.bigint "project_id"
    t.integer "status"
    t.string "remarks"
    t.string "admin_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_volunteer_project_joins_on_project_id"
    t.index ["volunteer_id"], name: "index_volunteer_project_joins_on_volunteer_id"
  end

  create_table "volunteer_skill_joins", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.bigint "skill_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_volunteer_skill_joins_on_skill_id"
    t.index ["volunteer_id"], name: "index_volunteer_skill_joins_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "cv_file"
    t.string "linked_in_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_volunteers_on_user_id"
  end

end
