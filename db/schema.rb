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

ActiveRecord::Schema.define(version: 20170325190440) do

  create_table "genders", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outings", force: :cascade do |t|
    t.integer "date_number"
    t.integer "history_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_dates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_outings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "outing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "gender_id",              null: false
    t.integer  "gender_preference_id"
    t.integer  "favorite_team_id"
    t.integer  "least_favorite_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password"
    t.integer  "age"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "profile_image"
  end

end
