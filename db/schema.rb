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

ActiveRecord::Schema.define(version: 20140619235921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievables", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "achievables", ["id", "type"], name: "index_achievables_on_id_and_type", using: :btree

  create_table "achievables_users", force: true do |t|
    t.integer "achievable_id"
    t.integer "user_id"
  end

  add_index "achievables_users", ["achievable_id", "user_id"], name: "index_achievables_users_on_achievable_id_and_user_id", using: :btree
  add_index "achievables_users", ["user_id", "achievable_id"], name: "index_achievables_users_on_user_id_and_achievable_id", using: :btree

  create_table "badges_engine_awards", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_engine_badges", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "award_id"
  end

  add_index "badges_engine_badges", ["award_id"], name: "index_badges_engine_badges_on_award_id", using: :btree

  create_table "positions", force: true do |t|
    t.string "name"
    t.string "description"
    t.string "image_url"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills_users", id: false, force: true do |t|
    t.integer "skill_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "skills_users", ["skill_id", "user_id"], name: "index_skills_users_on_skill_id_and_user_id", using: :btree
  add_index "skills_users", ["user_id", "skill_id"], name: "index_skills_users_on_user_id_and_skill_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
    t.string   "department"
    t.string   "picture_url"
    t.text     "bio"
    t.integer  "position_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["position_id"], name: "index_users_on_position_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
