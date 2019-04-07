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

ActiveRecord::Schema.define(version: 20190324134455) do

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "topic_content_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["topic_content_id"], name: "index_images_on_topic_content_id", using: :btree
  end

  create_table "topic_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_name"
    t.text     "content",    limit: 65535
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["topic_id"], name: "index_topic_contents_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_topic_contents_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",           limit: 65535
    t.integer  "topic_category_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["topic_category_id"], name: "index_topics_on_topic_category_id", using: :btree
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "profile"
    t.string   "image_name"
  end

  add_foreign_key "images", "topic_contents"
  add_foreign_key "topic_contents", "topics"
  add_foreign_key "topic_contents", "users"
  add_foreign_key "topics", "topic_categories"
  add_foreign_key "topics", "users"
end
