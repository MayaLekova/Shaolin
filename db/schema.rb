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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120216214248) do

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "command"
    t.string   "file_extension"
    t.text     "wrapping_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "points"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        :default => false
  end

  create_table "paragraphs", :force => true do |t|
    t.integer  "position"
    t.text     "body"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paragraphs", ["lesson_id"], :name => "index_paragraphs_on_lesson_id"

  create_table "tasks", :force => true do |t|
    t.integer  "position"
    t.text     "input"
    t.text     "output"
    t.text     "expectation"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["lesson_id"], :name => "index_tasks_on_lesson_id"

end

