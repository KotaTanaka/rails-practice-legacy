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

ActiveRecord::Schema.define(version: 2019_03_09_063344) do

  create_table "reviews", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.boolean "publish_status", null: false
    t.integer "evaluation", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shop_id", limit: 36, null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
  end

  create_table "services", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "wifi_name", null: false
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", id: :string, limit: 36, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ssid", null: false
    t.string "shop_name", null: false
    t.string "address", null: false
    t.string "shop_type"
    t.string "opening_houres"
    t.integer "seats_num"
    t.boolean "power"
    t.text "descriotion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "service_id", limit: 32, null: false
    t.index ["service_id"], name: "index_shops_on_service_id"
  end

  create_table "spots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reviews", "shops"
  add_foreign_key "shops", "services"
end
