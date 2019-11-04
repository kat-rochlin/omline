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

ActiveRecord::Schema.define(version: 2019_11_04_094917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_bookings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_bookings_on_event_id"
    t.index ["user_id"], name: "index_event_bookings_on_user_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_types_on_event_id"
    t.index ["type_id"], name: "index_event_types_on_type_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hub_id"
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.time "end_time"
    t.string "address"
    t.integer "capacity"
    t.string "photo"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hub_id"], name: "index_events_on_hub_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "hubs", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.text "description"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "hub_id"
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.string "hours"
    t.string "styles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hub_id"], name: "index_studios_on_hub_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.string "tag_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_certifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "certification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_teacher_certifications_on_certification_id"
    t.index ["user_id"], name: "index_teacher_certifications_on_user_id"
  end

  create_table "teaching_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_connections", force: :cascade do |t|
    t.bigint "connectee_id"
    t.bigint "connector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connectee_id"], name: "index_user_connections_on_connectee_id"
    t.index ["connector_id"], name: "index_user_connections_on_connector_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "nationality"
    t.text "description"
    t.bigint "hub_id"
    t.string "profile_photo"
    t.string "cover_photo"
    t.boolean "is_teacher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hub_id"], name: "index_users_on_hub_id"
  end

  add_foreign_key "event_bookings", "events"
  add_foreign_key "event_bookings", "users"
  add_foreign_key "event_types", "events"
  add_foreign_key "event_types", "types"
  add_foreign_key "events", "hubs"
  add_foreign_key "events", "users"
  add_foreign_key "studios", "hubs"
  add_foreign_key "teacher_certifications", "certifications"
  add_foreign_key "teacher_certifications", "users"
  add_foreign_key "user_connections", "users", column: "connectee_id"
  add_foreign_key "user_connections", "users", column: "connector_id"
  add_foreign_key "users", "hubs"
end
