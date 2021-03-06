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

ActiveRecord::Schema.define(version: 2019_07_18_135115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "people_needed"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "host_id"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["host_id"], name: "index_events_on_host_id"
  end

  create_table "potential_attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.integer "status", default: 0
    t.text "initial_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_potential_attendees_on_event_id"
    t.index ["user_id"], name: "index_potential_attendees_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar", default: "http://petmedmd.com/images/user-profile.png"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "users", column: "host_id"
  add_foreign_key "potential_attendees", "events"
  add_foreign_key "potential_attendees", "users"
end
