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

ActiveRecord::Schema.define(version: 2017_05_10_071659) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.string "schedule_file_name"
    t.string "schedule_content_type"
    t.integer "schedule_file_size"
    t.datetime "schedule_updated_at"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "dates"
    t.float "cost"
    t.string "link"
    t.string "number"
    t.string "address"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_hotels_on_event_id"
  end

  create_table "missing_competitors", force: :cascade do |t|
    t.string "name"
    t.integer "ring_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rings", force: :cascade do |t|
    t.integer "ring_number"
    t.string "ring_rank"
    t.string "ring_age"
    t.string "ring_gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "division"
    t.boolean "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
