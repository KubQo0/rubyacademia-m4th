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

ActiveRecord::Schema[7.2].define(version: 2025_06_25_195335) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.boolean "is_correct"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.integer "score"
    t.string "country"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "test_id", null: false
    t.bigint "user_id", null: false
    t.index ["test_id"], name: "index_attempts_on_test_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "attempts_questions", id: false, force: :cascade do |t|
    t.bigint "attempt_id", null: false
    t.bigint "question_id", null: false
    t.text "written_answer"
    t.integer "time"
    t.bigint "answer_id", null: false
    t.index ["answer_id"], name: "index_attempts_questions_on_answer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_questions", id: false, force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id", "question_id"], name: "index_categories_questions_on_category_id_and_question_id"
    t.index ["question_id", "category_id"], name: "index_categories_questions_on_question_id_and_category_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "assignment"
    t.boolean "is_multichoice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_tests", id: false, force: :cascade do |t|
    t.bigint "test_id", null: false
    t.bigint "question_id", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.integer "locale"
    t.string "translatable_type", null: false
    t.bigint "translatable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_type", "translatable_id"], name: "index_translations_on_translatable"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.string "given_name"
    t.string "family_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "attempts", "tests"
  add_foreign_key "attempts", "users"
  add_foreign_key "attempts_questions", "answers"
end
