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

ActiveRecord::Schema.define(version: 2019_11_05_092342) do

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
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "address"
    t.integer "capacity"
    t.string "photo"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_name"
    t.index ["hub_id"], name: "index_events_on_hub_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true
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
    t.string "cover_photo"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_connection_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_connection_id"], name: "index_messages_on_user_connection_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
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
    t.string "photo"
    t.index ["hub_id"], name: "index_studios_on_hub_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.string "tag_type"
    t.string "tagable_type"
    t.bigint "tagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagable_type", "tagable_id"], name: "index_tags_on_tagable_type_and_tagable_id"
  end

  create_table "teacher_certifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "certification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_teacher_certifications_on_certification_id"
    t.index ["user_id"], name: "index_teacher_certifications_on_user_id"
  end

  create_table "teacher_experiences", force: :cascade do |t|
    t.bigint "user_id"
    t.string "studio_name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teacher_experiences_on_user_id"
  end

  create_table "teacher_languages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_teacher_languages_on_language_id"
    t.index ["user_id"], name: "index_teacher_languages_on_user_id"
  end

  create_table "teacher_teaching_styles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "teaching_style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teaching_style_id"], name: "index_teacher_teaching_styles_on_teaching_style_id"
    t.index ["user_id"], name: "index_teacher_teaching_styles_on_user_id"
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "nationality"
    t.text "description"
    t.bigint "hub_id"
    t.string "profile_photo"
    t.string "cover_photo"
    t.boolean "is_teacher"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "friendship_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["friendship_id"], name: "index_users_on_friendship_id"
    t.index ["hub_id"], name: "index_users_on_hub_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_bookings", "events"
  add_foreign_key "event_bookings", "users"
  add_foreign_key "event_types", "events"
  add_foreign_key "event_types", "types"
  add_foreign_key "events", "hubs"
  add_foreign_key "events", "users"
  add_foreign_key "messages", "user_connections"
  add_foreign_key "messages", "users"
  add_foreign_key "studios", "hubs"
  add_foreign_key "teacher_certifications", "certifications"
  add_foreign_key "teacher_certifications", "users"
  add_foreign_key "teacher_experiences", "users"
  add_foreign_key "teacher_languages", "languages"
  add_foreign_key "teacher_languages", "users"
  add_foreign_key "teacher_teaching_styles", "teaching_styles"
  add_foreign_key "teacher_teaching_styles", "users"
  add_foreign_key "user_connections", "users", column: "connectee_id"
  add_foreign_key "user_connections", "users", column: "connector_id"
  add_foreign_key "users", "friendships"
  add_foreign_key "users", "hubs"
end
