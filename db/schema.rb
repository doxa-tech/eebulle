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

ActiveRecord::Schema.define(version: 2018_04_21_125741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.time "time"
    t.boolean "main"
    t.integer "recurrence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image"
    t.index ["recurrence_id"], name: "index_activities_on_recurrence_id"
  end

  create_table "day_activities", id: :serial, force: :cascade do |t|
    t.integer "day_id"
    t.integer "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activity_id"], name: "index_day_activities_on_activity_id"
    t.index ["day_id"], name: "index_day_activities_on_day_id"
  end

  create_table "days", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.integer "duration"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image"
  end

  create_table "galleries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.date "date"
    t.string "speaker"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "category", default: 0
  end

  create_table "newsletter_emails", id: :serial, force: :cascade do |t|
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "confirmed", default: false
  end

  create_table "newsletters", id: :serial, force: :cascade do |t|
    t.string "subject"
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_newsletters_on_user_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paintings", id: :serial, force: :cascade do |t|
    t.string "image"
    t.integer "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["gallery_id"], name: "index_paintings_on_gallery_id"
  end

  create_table "recurrences", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "remember_token"
    t.string "password_digest"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "newsletters", "users"
end
