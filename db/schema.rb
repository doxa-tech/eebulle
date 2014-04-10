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

ActiveRecord::Schema.define(version: 20140410171052) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_activities", force: true do |t|
    t.integer  "day_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "day_activities", ["activity_id"], name: "index_day_activities_on_activity_id"
  add_index "day_activities", ["day_id"], name: "index_day_activities_on_day_id"

  create_table "days", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.date     "exp_at"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.text     "content"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recurrence_activities", force: true do |t|
    t.integer  "recurrence_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recurrence_activities", ["activity_id"], name: "index_recurrence_activities_on_activity_id"
  add_index "recurrence_activities", ["recurrence_id"], name: "index_recurrence_activities_on_recurrence_id"

  create_table "recurrences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
