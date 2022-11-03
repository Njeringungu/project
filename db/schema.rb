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

ActiveRecord::Schema[7.0].define(version: 2022_11_03_084033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.string "name"
    t.string "stories"
    t.float "amount"
    t.string "image"
    t.bigint "charity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_id"], name: "index_beneficiaries_on_charity_id"
  end

  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "description"
    t.float "amount_donated"
    t.float "target_amount"
    t.integer "category", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved"
  end

  create_table "donations", force: :cascade do |t|
    t.float "amount"
    t.bigint "charity_id", null: false
    t.bigint "donor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_id"], name: "index_donations_on_charity_id"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "reminder"
    t.string "mode_of_donation"
    t.integer "status", default: 0
    t.integer "frequency", default: 0
    t.integer "donate", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "category", default: 0
    t.integer "status", default: 0
    t.bigint "charity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_id"], name: "index_forms_on_charity_id"
  end

  add_foreign_key "beneficiaries", "charities"
  add_foreign_key "donations", "charities"
  add_foreign_key "donations", "donors"
  add_foreign_key "forms", "charities"
end
