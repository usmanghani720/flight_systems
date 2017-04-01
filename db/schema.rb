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

ActiveRecord::Schema.define(version: 20170401181511) do

  create_table "results", force: :cascade do |t|
    t.string   "flight_cost"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "saved_search_id"
    t.string   "departure_time"
    t.string   "arrival_time"
  end

  add_index "results", ["saved_search_id"], name: "index_results_on_saved_search_id"

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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "adult_count"
    t.integer  "children_count"
    t.integer  "infants_on_seat_count"
    t.integer  "infants_in_lap_count"
    t.integer  "total_passenger_count"
    t.datetime "api_hit_time"
    t.integer  "api_hit_count",         default: 1
  end

end
