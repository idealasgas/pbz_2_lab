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

ActiveRecord::Schema.define(version: 2019_11_15_180934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "finish_date"
    t.string "subdivision"
    t.integer "sex"
    t.string "position"
    t.string "name"
    t.string "last_name"
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "reception_date"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "technics_repair_document_id"
    t.text "names", default: [], array: true
    t.index ["technics_repair_document_id"], name: "index_invoices_on_technics_repair_document_id"
  end

  create_table "technics_repair_documents", force: :cascade do |t|
    t.datetime "start_date"
    t.string "repair_type"
    t.integer "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "technics_unit_id"
    t.integer "client_id"
    t.integer "receiver_id"
    t.integer "repair_man_id"
    t.index ["technics_unit_id"], name: "index_technics_repair_documents_on_technics_unit_id"
  end

  create_table "technics_units", force: :cascade do |t|
    t.string "inventory_number"
    t.string "name"
    t.string "model"
    t.integer "production_year"
    t.string "subdivision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfer_documents", force: :cascade do |t|
    t.datetime "start_date"
    t.string "subdivision"
    t.datetime "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "technics_unit_id"
    t.index ["technics_unit_id"], name: "index_transfer_documents_on_technics_unit_id"
  end

  add_foreign_key "invoices", "technics_repair_documents"
  add_foreign_key "technics_repair_documents", "technics_units"
  add_foreign_key "transfer_documents", "technics_units"
end
