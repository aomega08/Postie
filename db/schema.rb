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

ActiveRecord::Schema.define(version: 2018_04_02_195550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "message_recipients", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "recipient_id", null: false
    t.string "name"
    t.integer "recipient_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_tags", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "from", null: false
    t.string "from_name"
    t.text "subject"
    t.text "headers", default: "{}", null: false
    t.text "html_content"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.index ["email"], name: "index_recipients_on_email", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  add_foreign_key "message_recipients", "messages", on_delete: :cascade
  add_foreign_key "message_recipients", "recipients", on_delete: :cascade
  add_foreign_key "message_tags", "messages", on_delete: :cascade
  add_foreign_key "message_tags", "tags", on_delete: :cascade
end
