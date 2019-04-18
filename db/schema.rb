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

ActiveRecord::Schema.define(version: 2019_04_17_154531) do

  create_table "battles", force: :cascade do |t|
    t.string "trainer_id"
    t.string "gym_id"
    t.boolean "victory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.integer "index"
    t.string "name"
    t.string "badge_name"
    t.string "badge_img"
    t.string "leader_name"
    t.string "leader_img"
    t.text "before_quote"
    t.text "after_quote"
    t.integer "number_of_questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owned_pokemons", force: :cascade do |t|
    t.integer "wild_pokemon_id"
    t.integer "trainer_id"
    t.boolean "nick_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "password_digest"
    t.string "profile_img"
    t.integer "num_badges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trivia", force: :cascade do |t|
    t.string "difficulty"
    t.string "question"
    t.string "correct_answer"
    t.string "incorrect_answer_1"
    t.string "incorrect_answer_2"
    t.string "incorrect_answer_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wild_pokemons", force: :cascade do |t|
    t.integer "pokedex_index"
    t.string "img"
    t.string "name"
    t.integer "height"
    t.integer "weight"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
