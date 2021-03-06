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

ActiveRecord::Schema.define(version: 20150423170654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "story_id"
    t.integer  "user_id"
  end

  add_index "comments", ["story_id"], name: "index_comments_on_story_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "importance_markers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "important"
  end

  add_index "importance_markers", ["story_id"], name: "index_importance_markers_on_story_id", using: :btree
  add_index "importance_markers", ["user_id"], name: "index_importance_markers_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "name"
  end

  add_index "locations", ["neighborhood_id"], name: "index_locations_on_neighborhood_id", using: :btree

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punches", force: :cascade do |t|
    t.integer  "punchable_id",                          null: false
    t.string   "punchable_type", limit: 20,             null: false
    t.datetime "starts_at",                             null: false
    t.datetime "ends_at",                               null: false
    t.datetime "average_time",                          null: false
    t.integer  "hits",                      default: 1, null: false
  end

  add_index "punches", ["average_time"], name: "index_punches_on_average_time", using: :btree
  add_index "punches", ["punchable_type", "punchable_id"], name: "punchable_index", using: :btree

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "location_id"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "neighborhood_id"
    t.integer  "importance",      default: 0
    t.string   "photo"
  end

  add_index "stories", ["category_id"], name: "index_stories_on_category_id", using: :btree
  add_index "stories", ["location_id"], name: "index_stories_on_location_id", using: :btree
  add_index "stories", ["neighborhood_id"], name: "index_stories_on_neighborhood_id", using: :btree
  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "stories"
  add_foreign_key "comments", "users"
  add_foreign_key "importance_markers", "stories"
  add_foreign_key "importance_markers", "users"
  add_foreign_key "locations", "neighborhoods"
  add_foreign_key "stories", "categories"
  add_foreign_key "stories", "locations"
  add_foreign_key "stories", "neighborhoods"
  add_foreign_key "stories", "users"
end
