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

ActiveRecord::Schema.define(version: 20140803143625) do

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
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.string   "id_number"
    t.string   "phone_number"
    t.integer  "group_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["group_id"], name: "index_users_on_group_id"
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
