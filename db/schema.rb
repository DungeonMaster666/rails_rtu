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

ActiveRecord::Schema.define(version: 2022_01_06_165950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bazesprods", force: :cascade do |t|
    t.string "prodnos"
    t.string "olb"
    t.string "tauki"
    t.string "oglh"
    t.string "kcal"
    t.string "A"
    t.string "B1"
    t.string "B2"
    t.string "C"
    t.string "Ca"
    t.string "P"
    t.string "Fe"
    t.string "cena", default: "0"
    t.string "min", default: "0"
    t.string "max", default: "300"
  end

  create_table "edienkartes", force: :cascade do |t|
    t.integer "user_id"
    t.string "prodnos"
    t.float "nutrition1"
    t.string "shopnos"
    t.string "cena"
    t.string "linktophoto"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lietotajaparametrs", force: :cascade do |t|
    t.float "svars"
    t.integer "augums"
    t.integer "vecums"
    t.string "dzimums"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "koef", default: 0.0
    t.float "goal", default: 0.0
  end

  create_table "nevelprods", force: :cascade do |t|
    t.integer "user_id"
    t.string "prod_nos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "velprods", force: :cascade do |t|
    t.integer "user_id"
    t.string "prod_nos"
    t.string "olb"
    t.string "tauki"
    t.string "oglh"
    t.string "kcal"
    t.string "A"
    t.string "B1"
    t.string "B2"
    t.string "C"
    t.string "Ca"
    t.string "P"
    t.string "Fe"
    t.string "cena", default: "0"
    t.string "min", default: "0"
    t.string "max", default: "300"
  end

end
