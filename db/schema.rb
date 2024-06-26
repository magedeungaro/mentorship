# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 2024_04_06_190337) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'email_verification_tokens', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_email_verification_tokens_on_user_id'
  end

  create_table 'mentees', force: :cascade do |t|
    t.string 'name'
    t.text 'bio'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'mentors', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'url'
    t.text 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'password_reset_tokens', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_password_reset_tokens_on_user_id'
  end

  create_table 'sessions', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'user_agent'
    t.string 'ip_address'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_sessions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'password_digest', null: false
    t.boolean 'verified', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'email_verification_tokens', 'users'
  add_foreign_key 'password_reset_tokens', 'users'
  add_foreign_key 'sessions', 'users'
  create_table "schedules", force: :cascade do |t|
    t.bigint "mentor_id", null: false
    t.bigint "mentee_id", null: false
    t.datetime "date"
    t.string "description"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_schedules_on_mentee_id"
    t.index ["mentor_id"], name: "index_schedules_on_mentor_id"
  end

  add_foreign_key "schedules", "mentees"
  add_foreign_key "schedules", "mentors"
end
