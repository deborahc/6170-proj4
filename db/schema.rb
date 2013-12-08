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

ActiveRecord::Schema.define(version: 20131208011608) do

  create_table "emails", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.text     "message"
  end

  create_table "postings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supervisor_id"
    t.string   "title"
    t.string   "skills"
    t.string   "funding_type"
    t.text     "description"
  end

  create_table "reviews", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supervisor_id"
    t.integer  "student_id"
    t.text     "reflection"
    t.integer  "time_commitment"
    t.string   "expected"
    t.text     "work_description"
    t.boolean  "anonymous"
    t.string   "overall_rating"
    t.string   "supervisor_rating"
  end

  create_table "urop_applications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "posting_id"
    t.integer  "student_id"
    t.text     "message"
    t.integer  "supervisor_id"
    t.string   "status"
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
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

end
