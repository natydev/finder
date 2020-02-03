# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_02_141432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "allowances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "owner_id"
    t.string "allowanceable_type", null: false
    t.uuid "allowanceable_id", null: false
    t.uuid "user_id", null: false
    t.boolean "read"
    t.boolean "create"
    t.boolean "update"
    t.boolean "delete"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["allowanceable_type", "allowanceable_id"], name: "index_allowances_on_allowanceable_type_and_allowanceable_id"
    t.index ["owner_id"], name: "index_allowances_on_owner_id"
    t.index ["user_id"], name: "index_allowances_on_user_id"
  end

  create_table "box_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "box_id", null: false
    t.uuid "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["box_id"], name: "index_box_tags_on_box_id"
    t.index ["tag_id"], name: "index_box_tags_on_tag_id"
  end

  create_table "boxes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "spot_id", null: false
    t.uuid "owner_id"
    t.string "summary"
    t.string "code"
    t.date "issued_on"
    t.integer "items_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "picture_data"
    t.string "typology", limit: 3, comment: "available typologies are: 'st' = Standalone and 'cl' = Cluster"
    t.integer "quantity", default: 1
    t.integer "items_quantity"
    t.integer "free_ratio"
    t.integer "volume"
    t.boolean "using"
    t.string "notes"
    t.string "code_prefix", limit: 5
    t.integer "code_number"
    t.index ["code_number"], name: "index_boxes_on_code_number"
    t.index ["code_prefix"], name: "index_boxes_on_code_prefix"
    t.index ["owner_id"], name: "index_boxes_on_owner_id"
    t.index ["spot_id"], name: "index_boxes_on_spot_id"
    t.index ["typology"], name: "index_boxes_on_typology"
  end

  create_table "item_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.uuid "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_tags_on_item_id"
    t.index ["tag_id"], name: "index_item_tags_on_tag_id"
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "box_id", null: false
    t.string "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "picture_data"
    t.uuid "owner_id", null: false
    t.integer "quantity", default: 1
    t.boolean "using"
    t.index ["box_id"], name: "index_items_on_box_id"
    t.index ["owner_id"], name: "index_items_on_owner_id"
  end

  create_table "places", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "owner_id", null: false
    t.string "code"
    t.index ["owner_id"], name: "index_places_on_owner_id"
  end

  create_table "spots", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "place_id", null: false
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "owner_id", null: false
    t.index ["owner_id"], name: "index_spots_on_owner_id"
    t.index ["place_id"], name: "index_spots_on_place_id"
  end

  create_table "tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "owner_id", null: false
    t.string "color"
    t.string "background"
    t.index ["owner_id"], name: "index_tags_on_owner_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "full_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.uuid "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.json "object"
    t.json "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "allowances", "users"
  add_foreign_key "allowances", "users", column: "owner_id"
  add_foreign_key "box_tags", "boxes"
  add_foreign_key "box_tags", "tags"
  add_foreign_key "boxes", "spots"
  add_foreign_key "boxes", "users", column: "owner_id"
  add_foreign_key "item_tags", "items"
  add_foreign_key "item_tags", "tags"
  add_foreign_key "items", "boxes"
  add_foreign_key "spots", "places"
end
