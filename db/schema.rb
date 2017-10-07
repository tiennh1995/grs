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

ActiveRecord::Schema.define(version: 20171007094734) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "review_id",  null: false
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emotitions", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "review_id",      null: false
    t.integer  "emotition_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "game_genres", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "genre_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "required"
    t.string   "info"
    t.string   "cover"
    t.float    "point",      default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "game_id",    null: false
    t.integer  "point"
    t.string   "title",      null: false
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screenshots", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.string   "image",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nick_name"
    t.string   "avatar"
    t.integer  "sex",                    default: 0
    t.boolean  "admin",                  default: false
    t.datetime "birthday",               default: '2017-10-07 12:45:52'
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
