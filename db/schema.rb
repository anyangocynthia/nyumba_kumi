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

ActiveRecord::Schema.define(version: 20140803205048) do

  create_table "appartment_residents", force: true do |t|
    t.integer  "appartment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appartment_residents", ["appartment_id"], name: "index_appartment_residents_on_appartment_id"
  add_index "appartment_residents", ["user_id"], name: "index_appartment_residents_on_user_id"

  create_table "appartments", force: true do |t|
    t.string   "house_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appartments", ["user_id"], name: "index_appartments_on_user_id"

  create_table "attendees", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id"
  add_index "attendees", ["user_id"], name: "index_attendees_on_user_id"

  create_table "branches", force: true do |t|
    t.integer  "company_id"
    t.string   "phone_number"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer  "service_id"
    t.string   "location"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["service_id"], name: "index_companies_on_service_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "time_of_event"
    t.string   "venue"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_companies", force: true do |t|
    t.integer  "group_id"
    t.integer  "company_id"
    t.string   "company_type"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_companies", ["branch_id"], name: "index_group_companies_on_branch_id"
  add_index "group_companies", ["company_id"], name: "index_group_companies_on_company_id"
  add_index "group_companies", ["group_id"], name: "index_group_companies_on_group_id"

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "houses", force: true do |t|
    t.string   "house_name"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "houses", ["user_id"], name: "index_houses_on_user_id"

  create_table "members", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id"
  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "id_number"
    t.integer  "group_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verification_code"
    t.boolean  "verified"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id"

end
