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

ActiveRecord::Schema.define(version: 2019_12_03_083755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "flats", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.text "description"
    t.integer "nb_rooms", default: 1
    t.integer "area"
    t.boolean "furnished", default: false
    t.string "syndic_name"
    t.string "syndic_phone"
    t.string "syndic_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
    t.string "city"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.bigint "flat_id"
    t.date "date"
    t.string "status", default: "En cours"
    t.string "dispo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "reparation"
    t.string "tarif"
    t.string "responsable"
    t.string "last_answer"
    t.text "comment"
    t.index ["flat_id"], name: "index_incidents_on_flat_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flat_id"
    t.date "start_date"
    t.integer "duration", default: 3
    t.integer "loyer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_rentals_on_flat_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.bigint "rental_id"
    t.string "status"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_rents_on_rental_id"
  end

  create_table "user_workers", force: :cascade do |t|
    t.bigint "worker_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_workers_on_user_id"
    t.index ["worker_id"], name: "index_user_workers_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "address"
  end

  create_table "works", force: :cascade do |t|
    t.float "price"
    t.string "comment"
    t.date "date"
    t.bigint "incident_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_works_on_incident_id"
    t.index ["worker_id"], name: "index_works_on_worker_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "flats", "users"
  add_foreign_key "incidents", "flats"
  add_foreign_key "rentals", "flats"
  add_foreign_key "rentals", "users"
  add_foreign_key "user_workers", "users"
  add_foreign_key "user_workers", "workers"
  add_foreign_key "works", "incidents"
  add_foreign_key "works", "workers"
end
