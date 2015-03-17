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

ActiveRecord::Schema.define(version: 20150317122040) do

  create_table "accounts", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "setup",      default: false
    t.string   "api_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "appartment_residents", force: true do |t|
    t.integer  "appartment_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appartment_residents", ["appartment_id"], name: "index_appartment_residents_on_appartment_id"
  add_index "appartment_residents", ["contact_id"], name: "index_appartment_residents_on_contact_id"

  create_table "appartments", force: true do |t|
    t.string   "house_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appartments", ["contact_id"], name: "index_appartments_on_contact_id"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "published",                  default: false
    t.string   "feature_image_file_name"
    t.string   "feature_image_content_type"
    t.integer  "feature_image_file_size"
    t.datetime "feature_image_updated_at"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "attendees", force: true do |t|
    t.integer  "event_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendees", ["contact_id"], name: "index_attendees_on_contact_id"
  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id"

  create_table "branches", force: true do |t|
    t.integer  "company_id"
    t.string   "phone_number"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "branches", ["account_id"], name: "index_branches_on_account_id"
  add_index "branches", ["company_id"], name: "index_branches_on_company_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer  "service_id"
    t.string   "location"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "account_id"
  end

  add_index "companies", ["account_id"], name: "index_companies_on_account_id"
  add_index "companies", ["service_id"], name: "index_companies_on_service_id"
  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "id_number"
    t.integer  "group_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verification_code"
    t.boolean  "verified"
    t.integer  "house_id"
    t.string   "house_number"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "contacts", ["group_id"], name: "index_contacts_on_group_id"
  add_index "contacts", ["house_id"], name: "index_contacts_on_house_id"

  create_table "devices", force: true do |t|
    t.integer  "contact_id"
    t.string   "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["contact_id"], name: "index_devices_on_contact_id"

  create_table "estates", force: true do |t|
    t.string   "house_name"
    t.string   "location"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "estates", ["contact_id"], name: "index_estates_on_contact_id"

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
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "groups", ["contact_id"], name: "index_groups_on_contact_id"

  create_table "incidents", force: true do |t|
    t.string   "incident_type"
    t.integer  "contact_id"
    t.integer  "notification_id"
    t.string   "location"
    t.boolean  "resolved"
    t.boolean  "false_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "viewed",          default: false
    t.integer  "account_id"
  end

  add_index "incidents", ["account_id"], name: "index_incidents_on_account_id"
  add_index "incidents", ["company_id"], name: "index_incidents_on_company_id"
  add_index "incidents", ["contact_id"], name: "index_incidents_on_contact_id"
  add_index "incidents", ["notification_id"], name: "index_incidents_on_notification_id"

  create_table "members", force: true do |t|
    t.integer  "contact_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["contact_id"], name: "index_members_on_contact_id"
  add_index "members", ["group_id"], name: "index_members_on_group_id"

  create_table "notification_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alert_message"
  end

  create_table "notifications", force: true do |t|
    t.integer  "contact_id"
    t.integer  "group_id"
    t.integer  "notification_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "message"
  end

  add_index "notifications", ["contact_id"], name: "index_notifications_on_contact_id"
  add_index "notifications", ["group_id"], name: "index_notifications_on_group_id"
  add_index "notifications", ["notification_type_id"], name: "index_notifications_on_notification_type_id"

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

  create_table "user_accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.boolean  "is_preferred", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_accounts", ["account_id"], name: "index_user_accounts_on_account_id"
  add_index "user_accounts", ["user_id"], name: "index_user_accounts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "is_admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "is_support",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
