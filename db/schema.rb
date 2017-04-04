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

ActiveRecord::Schema.define(version: 20170403053328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string   "icao_code"
    t.string   "iata_code"
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.integer  "lat_deg"
    t.integer  "lat_min"
    t.integer  "lat_sec"
    t.string   "lat_dir"
    t.integer  "lon_deg"
    t.integer  "lon_min"
    t.integer  "lon_sec"
    t.string   "lon_dir"
    t.integer  "altitude"
    t.float    "lat_decimal"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "lon_decimal"
  end

  create_table "results", force: :cascade do |t|
    t.string   "flight_cost"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "saved_search_id"
    t.string   "departure_time"
    t.string   "arrival_time"
  end

  add_index "results", ["saved_search_id"], name: "index_results_on_saved_search_id", using: :btree

  create_table "saved_searches", force: :cascade do |t|
    t.string   "date1"
    t.string   "date2"
    t.string   "start"
    t.string   "end"
    t.string   "price_max"
    t.string   "price_min"
    t.string   "duration"
    t.string   "flight_type"
    t.string   "flight_class"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "adult_count"
    t.integer  "children_count"
    t.integer  "infants_on_seat_count"
    t.integer  "infants_in_lap_count"
    t.integer  "total_passenger_count"
    t.datetime "api_hit_time"
    t.integer  "api_hit_count"
  end

  add_foreign_key "results", "saved_searches"
end
