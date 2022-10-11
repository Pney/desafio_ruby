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

ActiveRecord::Schema.define(version: 2022_10_07_172545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "log_logins", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_log_logins_on_user_id"
  end

  create_table "status_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_status_lists_on_user_id"
  end

  create_table "to_dos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "uni_code"
    t.string "title"
    t.text "description"
    t.string "category"
    t.boolean "public_permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_list_id"
    t.index ["status_list_id"], name: "index_to_dos_on_status_list_id"
    t.index ["user_id"], name: "index_to_dos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name_user", null: false
    t.string "email", null: false
    t.bigint "phone", null: false
    t.bigint "cpf", null: false
    t.string "gender", null: false
    t.string "profile", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_profile"
    t.string "token_public"
    t.string "token_private"
    t.boolean "public_permission"
    t.index ["token_private"], name: "index_users_on_token_private", unique: true
    t.index ["token_public"], name: "index_users_on_token_public", unique: true
  end

  add_foreign_key "log_logins", "users"
  add_foreign_key "status_lists", "users"
  add_foreign_key "to_dos", "status_lists"
  add_foreign_key "to_dos", "users"
end
