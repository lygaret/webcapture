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

ActiveRecord::Schema.define(version: 20151213050634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "captures", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "key",                    null: false
    t.text     "content",                null: false
    t.integer  "status",     default: 0
  end

  add_index "captures", ["user_id", "key"], name: "index_captures_on_user_id_and_key", unique: true, using: :btree
  add_index "captures", ["user_id"], name: "index_captures_on_user_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "key",        null: false
    t.text     "template",   null: false
    t.text     "properties"
  end

  add_index "templates", ["user_id", "key"], name: "index_templates_on_user_id_and_key", unique: true, using: :btree
  add_index "templates", ["user_id"], name: "index_templates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email",    null: false
    t.string "passhash", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "captures", "users", name: "captures_user_id_fk", on_delete: :cascade
  add_foreign_key "templates", "users", name: "templates_user_id_fk", on_delete: :cascade
end
