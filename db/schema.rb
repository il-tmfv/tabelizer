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

ActiveRecord::Schema.define(version: 20160213211023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "title"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
    t.string   "title"
    t.integer  "status_id"
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id", using: :btree
  add_index "projects", ["status_id"], name: "index_projects_on_status_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_entries", force: :cascade do |t|
    t.string   "comment"
    t.float    "duration"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "table_entries", ["project_id"], name: "index_table_entries_on_project_id", using: :btree
  add_index "table_entries", ["user_id"], name: "index_table_entries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "projects"
  add_foreign_key "assignments", "users"
  add_foreign_key "projects", "customers"
  add_foreign_key "projects", "statuses"
  add_foreign_key "table_entries", "projects"
  add_foreign_key "table_entries", "users"
end
