# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151024163344) do


  create_table "bank_credits", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "credit_sum",        limit: 4
    t.integer  "credit_term",       limit: 4
    t.integer  "credit_limit_term", limit: 4
    t.integer  "total_income",      limit: 4
    t.integer  "make_insurance",    limit: 4
    t.integer  "repayment_method",  limit: 4
  end

  create_table "cities", force: :cascade do |t|
    t.string  "name",       limit: 45, null: false
    t.integer "country_id", limit: 4,  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 45, null: false
  end


  create_table "online_credit", force: :cascade do |t|
    t.integer "creditProductType",      limit: 4
    t.integer "currencyType",           limit: 4
    t.integer "sumValue",               limit: 4
    t.integer "termLoanProduct",        limit: 4
    t.integer "provisionType",          limit: 4
    t.text    "otherProvisionType",     limit: 65535
    t.string  "organizationName",       limit: 255
    t.string  "customersAddress",       limit: 255
    t.integer "mainActivityType",       limit: 4
    t.string  "altMainActivity",        limit: 255
    t.integer "organizationExperience", limit: 4
    t.string  "customersFirstname",     limit: 255
    t.string  "customersLastname",      limit: 255
    t.string  "customersPatronymic",    limit: 255
    t.string  "customersPhone",         limit: 255
    t.string  "customersEmail",         limit: 255
  end

  create_table "online_credits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end



  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

 

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
