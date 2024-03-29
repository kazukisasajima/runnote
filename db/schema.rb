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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_06_01_142241) do
=======
ActiveRecord::Schema.define(version: 2022_05_05_134031) do
>>>>>>> 79c4a97fecbc81a236a6630201877df0b0404dd0

  create_table "plans", charset: "utf8mb4", force: :cascade do |t|
    t.string "menu"
    t.string "time"
    t.text "detail"
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "records", charset: "utf8mb4", force: :cascade do |t|
    t.string "train"
    t.text "result"
    t.text "review"
    t.datetime "start_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "best"
    t.string "race"
    t.string "target"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
<<<<<<< HEAD
=======
  end

  create_table "workouts", charset: "utf8mb4", force: :cascade do |t|
    t.string "task"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "tday"
    t.index ["user_id"], name: "index_workouts_on_user_id"
>>>>>>> 79c4a97fecbc81a236a6630201877df0b0404dd0
  end

  add_foreign_key "plans", "users"
  add_foreign_key "records", "users"
end
