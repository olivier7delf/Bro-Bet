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

ActiveRecord::Schema.define(version: 2020_08_27_100707) do

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

  create_table "bet_participations", force: :cascade do |t|
    t.bigint "bet_id", null: false
    t.bigint "user_id", null: false
    t.boolean "user_choice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bet_id"], name: "index_bet_participations_on_bet_id"
    t.index ["user_id"], name: "index_bet_participations_on_user_id"
  end

  create_table "bets", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "result"
    t.string "stake"
    t.boolean "owner_choice"
    t.datetime "closed_at"
    t.datetime "resulted_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "tournament_bets", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "bet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bet_id"], name: "index_tournament_bets_on_bet_id"
    t.index ["tournament_id"], name: "index_tournament_bets_on_tournament_id"
  end

  create_table "tournament_participations", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "user_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tournament_id"], name: "index_tournament_participations_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_participations_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "stake"
    t.datetime "closed_at"
    t.datetime "resulted_at"
    t.integer "max_bets_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bet_participations", "bets"
  add_foreign_key "bet_participations", "users"
  add_foreign_key "bets", "users"
  add_foreign_key "tournament_bets", "bets"
  add_foreign_key "tournament_bets", "tournaments"
  add_foreign_key "tournament_participations", "tournaments"
  add_foreign_key "tournament_participations", "users"
  add_foreign_key "tournaments", "users"
end
