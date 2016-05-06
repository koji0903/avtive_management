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

ActiveRecord::Schema.define(version: 20160506001156) do

  create_table "categorizations", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "item_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "categorizations", ["item_category_id"], name: "index_categorizations_on_item_category_id"
  add_index "categorizations", ["item_id"], name: "index_categorizations_on_item_id"

  create_table "item_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "place"
    t.string   "status"
    t.float    "number",            null: false
    t.integer  "unit_id"
    t.string   "description"
    t.string   "image"
    t.date     "updated_date"
    t.integer  "updated_person_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "items", ["name"], name: "index_items_on_name", unique: true
  add_index "items", ["unit_id"], name: "index_items_on_unit_id"
  add_index "items", ["updated_person_id"], name: "index_items_on_updated_person_id"

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
