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

ActiveRecord::Schema[7.2].define(version: 2025_06_03_011703) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptom_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id", "symptom_id"], name: "index_symptom_ingredients_on_ingredient_id_and_symptom_id", unique: true
    t.index ["ingredient_id"], name: "index_symptom_ingredients_on_ingredient_id"
    t.index ["symptom_id"], name: "index_symptom_ingredients_on_symptom_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_symptoms_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "reset_password_token"
    t.string "string"
    t.string "salt"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "symptom_ingredients", "ingredients"
  add_foreign_key "symptom_ingredients", "symptoms"
end
