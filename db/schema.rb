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

ActiveRecord::Schema.define(version: 20140828132509) do

  create_table "dashboards", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "balance"
  end

  create_table "dateranges", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "dashboard_id"
    t.datetime "datefrom"
    t.datetime "dateto"
  end

  create_table "ecosts", force: true do |t|
    t.date     "date"
    t.string   "title"
    t.float    "ecost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dashboard_id"
    t.integer  "user_id"
  end

  create_table "eincomes", force: true do |t|
    t.date     "date"
    t.string   "title"
    t.float    "eincome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dashboard_id"
    t.integer  "user_id"
  end

  create_table "rcosts", force: true do |t|
    t.date     "date"
    t.string   "title"
    t.float    "rcost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dashboard_id"
    t.integer  "user_id"
  end

  create_table "rincomes", force: true do |t|
    t.date     "date"
    t.string   "title"
    t.float    "rincome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dashboard_id"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
