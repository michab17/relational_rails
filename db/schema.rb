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

ActiveRecord::Schema.define(version: 2021_10_13_230211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.boolean "has_covid"
    t.integer "age"
    t.datetime "day_added"
    t.datetime "release_date"
    t.bigint "zoo_id"
    t.index ["zoo_id"], name: "index_animals_on_zoo_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.boolean "royalty_member"
    t.integer "room_number"
    t.datetime "check_in"
    t.datetime "expected_check_out"
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_guests_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.boolean "vacancy"
    t.integer "occupancy"
    t.datetime "opening_day"
    t.datetime "newest_check_in"
  end

  create_table "zoos", force: :cascade do |t|
    t.string "name"
    t.boolean "open"
    t.integer "num_of_people"
    t.datetime "opening_day"
    t.datetime "animal_added"
  end

  add_foreign_key "animals", "zoos"
  add_foreign_key "guests", "hotels"
end
