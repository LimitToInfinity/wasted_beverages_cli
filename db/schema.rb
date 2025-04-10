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

ActiveRecord::Schema[8.0].define(version: 2020_07_12_080006) do
  create_table "alcohols", force: :cascade do |t|
    t.string "kind"
  end

  create_table "beverage_alcohols", force: :cascade do |t|
    t.integer "beverage_id", null: false
    t.integer "alcohol_id", null: false
    t.index ["alcohol_id"], name: "index_beverage_alcohols_on_alcohol_id"
    t.index ["beverage_id", "alcohol_id"], name: "index_beverage_alcohols_on_beverage_id_and_alcohol_id", unique: true
    t.index ["beverage_id"], name: "index_beverage_alcohols_on_beverage_id"
  end

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.integer "strength"
  end

  create_table "user_beverages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "beverage_id", null: false
    t.index ["beverage_id"], name: "index_user_beverages_on_beverage_id"
    t.index ["user_id", "beverage_id"], name: "index_user_beverages_on_user_id_and_beverage_id", unique: true
    t.index ["user_id"], name: "index_user_beverages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

  add_foreign_key "beverage_alcohols", "alcohols"
  add_foreign_key "beverage_alcohols", "beverages"
  add_foreign_key "user_beverages", "beverages"
  add_foreign_key "user_beverages", "users"
end
