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

ActiveRecord::Schema.define(version: 20131116061755) do

  create_table "applications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "posting_id"
    t.integer  "student_id"
    t.text     "message"
  end

  create_table "postings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supervisor_id"
    t.string   "title"
    t.string   "description"
    t.string   "skills"
    t.string   "funding_type"
  end

  create_table "reviews", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supervisor_id"
    t.integer  "student_id"
    t.text     "reflection"
    t.integer  "overall_rating"
    t.integer  "supervisor_rating"
    t.integer  "time_commitment"
    t.boolean  "recommended"
  end

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "major"
    t.string   "year"
    t.string   "resume"
    t.string   "password_digest"
  end

  create_table "supervisors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "lab"
    t.string   "title"
    t.string   "email"
    t.string   "department"
    t.string   "office"
    t.string   "password_digest"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "major"
    t.string   "year"
    t.string   "resume"
    t.string   "password_digest"
    t.string   "lab"
    t.string   "title"
    t.string   "department"
    t.string   "office"
    t.string   "type"
  end

end
