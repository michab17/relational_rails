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

ActiveRecord::Schema.define(version: 2021_10_12_202726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
