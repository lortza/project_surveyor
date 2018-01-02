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

ActiveRecord::Schema.define(version: 20180102163442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_options", force: :cascade do |t|
    t.bigint "question_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "required", default: false
    t.integer "qty_options", default: 1
    t.boolean "multiple_permitted", default: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "submission_id", null: false
    t.index ["question_option_id"], name: "index_user_answers_on_question_option_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "user_answers", "question_options"
  add_foreign_key "user_answers", "users"
end
