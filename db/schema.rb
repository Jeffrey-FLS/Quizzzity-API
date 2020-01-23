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

ActiveRecord::Schema.define(version: 2020_01_23_140737) do

  create_table "questions", force: :cascade do |t|
    t.string "question", null: false
    t.string "questionType", null: false
    t.string "singleMultiple", null: false
    t.string "correctAnswer", null: false
    t.string "answerOne", null: false
    t.string "answerTwo", null: false
    t.string "answerThree", null: false
    t.integer "quiz_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title", null: false
    t.string "img", default: "", null: false
    t.integer "duration", default: 0, null: false
    t.string "difficulty", default: "beginner", null: false
    t.integer "num_of_questions", default: 0, null: false
    t.integer "quizzed", default: 0, null: false
    t.boolean "collaborative", default: true, null: false
    t.boolean "personal", default: false, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_quizzes_on_title"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 35, null: false
    t.string "last_name", limit: 35, null: false
    t.string "email", limit: 100, default: "", null: false
    t.string "username", limit: 25, null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "users"
end
