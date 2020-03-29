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

ActiveRecord::Schema.define(version: 2020_03_25_211311) do

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "born_day"
    t.boolean "is_admin", default: false
    t.boolean "is_active", default: true
    t.string "name", null: false
    t.string "cpf", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_employees_on_cpf", unique: true
    t.index ["email"], name: "index_employees_on_email", unique: true
  end

  create_table "time_registers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "registered_by_id", null: false
    t.datetime "registered_at", null: false
    t.text "justification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_time_registers_on_employee_id"
    t.index ["registered_by_id"], name: "index_time_registers_on_registered_by_id"
  end

  add_foreign_key "time_registers", "employees"
  add_foreign_key "time_registers", "employees", column: "registered_by_id"
end
