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

ActiveRecord::Schema.define(version: 2022_09_30_142057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  add_foreign_key "log_logins", "users"
  add_foreign_key "status_lists", "users"
  add_foreign_key "to_dos", "status_lists"
  add_foreign_key "to_dos", "users"
end
