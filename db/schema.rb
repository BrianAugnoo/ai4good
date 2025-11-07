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

ActiveRecord::Schema[8.0].define(version: 2025_11_07_192937) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "Default"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "age_examiners", force: :cascade do |t|
    t.bigint "examiner_id", null: false
    t.bigint "age_section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_section_id"], name: "index_age_examiners_on_age_section_id"
    t.index ["examiner_id"], name: "index_age_examiners_on_examiner_id"
  end

  create_table "age_sections", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size", default: "f"
  end

  create_table "criteria", force: :cascade do |t|
    t.string "name"
    t.integer "coeffs", default: 1
    t.float "values"
    t.bigint "examiner_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "criterium_category_id", null: false
    t.index ["criterium_category_id"], name: "index_criteria_on_criterium_category_id"
    t.index ["examiner_id"], name: "index_criteria_on_examiner_id"
    t.index ["group_id"], name: "index_criteria_on_group_id"
  end

  create_table "criterium_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "age_section_id"
    t.boolean "first_rate", default: false
    t.boolean "second_rate", default: false
    t.float "note_totals", default: 0.0
    t.index ["age_section_id"], name: "index_groups_on_age_section_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "first_rate", default: false
    t.boolean "second_rate", default: false
    t.boolean "edit_rate", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "age_examiners", "age_sections"
  add_foreign_key "age_examiners", "examiners"
  add_foreign_key "criteria", "criterium_categories"
  add_foreign_key "criteria", "examiners"
  add_foreign_key "criteria", "groups"
  add_foreign_key "groups", "age_sections"
  add_foreign_key "members", "groups"
end
