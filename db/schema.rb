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

ActiveRecord::Schema[7.1].define(version: 2023_11_05_172057) do
  create_table "smart_lock_accesses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "smartlock_id"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["smartlock_id"], name: "index_smart_lock_accesses_on_smartlock_id"
    t.index ["user_id"], name: "index_smart_lock_accesses_on_user_id"
  end

  create_table "smartlocks", force: :cascade do |t|
    t.string "serial"
    t.integer "user_id"
    t.datetime "manufacturing_date"
    t.index ["user_id"], name: "index_smartlocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "master_user_id"
    t.index ["master_user_id"], name: "index_users_on_master_user_id"
  end

  add_foreign_key "smart_lock_accesses", "smartlocks"
  add_foreign_key "smart_lock_accesses", "users"
  add_foreign_key "smartlocks", "users"
end
