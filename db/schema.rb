# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_27_143305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "criteria", force: :cascade do |t|
    t.string "name"
    t.integer "coeffs", default: 1
    t.float "values"
    t.bigint "examiner_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examiner_id"], name: "index_criteria_on_examiner_id"
    t.index ["group_id"], name: "index_criteria_on_group_id"
  end

  create_table "evals", force: :cascade do |t|
    t.boolean "done", default: false
    t.bigint "examiner_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examiner_id"], name: "index_evals_on_examiner_id"
    t.index ["session_id"], name: "index_evals_on_session_id"
  end

  create_table "examiners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_examiners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_examiners_on_reset_password_token", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "etablished"
    t.string "name"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ratted", default: false
    t.string "timer", default: "0"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.boolean "is_valid", default: false
    t.bigint "admin_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "all_submited", default: false
    t.index ["admin_id"], name: "index_sessions_on_admin_id"
    t.index ["group_id"], name: "index_sessions_on_group_id"
  end

  add_foreign_key "criteria", "examiners"
  add_foreign_key "criteria", "groups"
  add_foreign_key "evals", "examiners"
  add_foreign_key "evals", "sessions"
  add_foreign_key "members", "groups"
  add_foreign_key "sessions", "admins"
  add_foreign_key "sessions", "groups"
end
