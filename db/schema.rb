# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_18_114403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_regions", force: :cascade do |t|
    t.integer "client_id"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "clients_hotel_branches", id: false, force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "hotel_branch_id", null: false
  end

  create_table "hotel_branches", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.integer "client_id"
    t.index ["location_id"], name: "index_hotel_branches_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "region_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_locations_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_facilities", force: :cascade do |t|
    t.string "name"
    t.bigint "room_id"
    t.bigint "room_facility_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_facility_category_id"], name: "index_room_facilities_on_room_facility_category_id"
    t.index ["room_id"], name: "index_room_facilities_on_room_id"
  end

  create_table "room_facility_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "hotel_branch_id"
    t.string "name"
    t.integer "capacity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_branch_id"], name: "index_rooms_on_hotel_branch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "locations", "regions"
  add_foreign_key "room_facilities", "room_facility_categories"
  add_foreign_key "room_facilities", "rooms"
  add_foreign_key "rooms", "hotel_branches"
end
