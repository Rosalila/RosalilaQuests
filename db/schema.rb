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

ActiveRecord::Schema.define(:version => 20111123161303) do

  create_table "completed_quests", :force => true do |t|
    t.integer  "quest_id"
    t.integer  "reviewer_id"
    t.integer  "profile_id"
    t.integer  "experience_won"
    t.integer  "kelo_won"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :id => false, :force => true do |t|
    t.integer "id",         :null => false
    t.integer "users_id"
    t.string  "real_name"
    t.string  "nick"
    t.string  "picture"
    t.date    "created_at"
    t.date    "updated_at"
  end

  add_index "profiles", ["users_id"], :name => "index_profiles_on_users_id"

  create_table "quest_masters", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "speciality_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quest_trees", :force => true do |t|
    t.integer  "dependant_id"
    t.integer  "dependancy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quests", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "speciality_id"
    t.integer  "level"
    t.string   "name"
    t.text     "description"
    t.integer  "experience"
    t.text     "kelo_description"
    t.integer  "kelo_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", :id => false, :force => true do |t|
    t.integer "id",          :null => false
    t.string  "name"
    t.string  "description"
    t.string  "picture"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer "id",              :null => false
    t.string  "email"
    t.string  "password_digest"
    t.date    "created_at"
    t.date    "updated_at"
  end

end
