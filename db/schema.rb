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

ActiveRecord::Schema.define(version: 20140422115316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.time     "time"
    t.boolean  "main"
    t.integer  "recurrence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "activities", ["recurrence_id"], name: "index_activities_on_recurrence_id", using: :btree

  create_table "day_activities", force: true do |t|
    t.integer  "day_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "day_activities", ["activity_id"], name: "index_day_activities_on_activity_id", using: :btree
  add_index "day_activities", ["day_id"], name: "index_day_activities_on_day_id", using: :btree

  create_table "days", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "duration"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "file"
    t.date     "date"
    t.string   "speaker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_emails", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.text     "content"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paintings", force: true do |t|
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paintings", ["gallery_id"], name: "index_paintings_on_gallery_id", using: :btree

  create_table "recurrences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "remember_token"
    t.string   "password_digest"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
