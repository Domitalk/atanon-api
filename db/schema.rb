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

ActiveRecord::Schema.define(version: 2020_02_10_161819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_stags", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "stag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_stags_on_post_id"
    t.index ["stag_id"], name: "index_post_stags_on_stag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "image_url"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.integer "rtype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_reactions_on_post_id"
  end

  create_table "stags", force: :cascade do |t|
    t.string "stagname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tagname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "post_stags", "posts"
  add_foreign_key "post_stags", "stags"
end
