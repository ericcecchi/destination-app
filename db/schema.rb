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

ActiveRecord::Schema.define(version: 2021_10_22_184229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guide_recommendations", force: :cascade do |t|
    t.bigint "guide_id", null: false
    t.bigint "recommendation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guide_id"], name: "index_guide_recommendations_on_guide_id"
    t.index ["recommendation_id"], name: "index_guide_recommendations_on_recommendation_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "locale_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locale_id"], name: "index_guides_on_locale_id"
    t.index ["user_id"], name: "index_guides_on_user_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.string "hero_image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "place_id", null: false
    t.index ["place_id"], name: "index_locales_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.integer "locale_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "details"
    t.string "external_place_id"
    t.index ["external_place_id"], name: "index_places_on_external_place_id", unique: true
    t.index ["locale_id"], name: "index_places_on_locale_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "place_id"
    t.string "title"
    t.index ["place_id"], name: "index_recommendations_on_place_id"
    t.index ["user_id", "created_at"], name: "index_recommendations_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "task_records", id: false, force: :cascade do |t|
    t.string "version", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "guide_recommendations", "guides"
  add_foreign_key "guide_recommendations", "recommendations"
  add_foreign_key "guides", "locales"
  add_foreign_key "guides", "users"
  add_foreign_key "locales", "places"
  add_foreign_key "places", "locales"
  add_foreign_key "recommendations", "places"
  add_foreign_key "recommendations", "users"
end
