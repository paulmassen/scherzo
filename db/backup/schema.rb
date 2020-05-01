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

ActiveRecord::Schema.define(version: 2020_04_30_162105) do

  create_table "Engagements_Structures", id: false, force: :cascade do |t|
    t.integer "Engagement_id", null: false
    t.integer "Structure_id", null: false
    t.index ["Engagement_id", "Structure_id"], name: "index_Engagements_Structures_on_engagement_id_and_structure_id"
    t.index ["Structure_id", "Engagement_id"], name: "index_Engagements_Structures_on_structure_id_and_engagement_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

# Could not dump table "artistes" because of following StandardError
#   Unknown type 'reference' for column 'engagement'

  create_table "engagements", force: :cascade do |t|
    t.string "title"
    t.date "begin"
    t.date "end"
    t.boolean "contract"
    t.boolean "hotel"
    t.boolean "taxi"
    t.boolean "sent"
    t.boolean "rehearsals"
    t.string "artiste"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "programme_id"
    t.boolean "voyages"
    t.integer "artiste_id"
    t.string "status"
    t.index ["artiste_id"], name: "index_engagements_on_artiste_id"
    t.index ["programme_id"], name: "index_engagements_on_programme_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "eventtype"
    t.date "eventdate"
    t.time "eventbegin"
    t.time "eventend"
    t.text "description1"
    t.text "description2"
    t.text "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "engagement_id"
    t.index ["engagement_id"], name: "index_events_on_engagement_id"
  end

  create_table "programmes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "structures", force: :cascade do |t|
    t.string "title"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "done"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.string "opus"
    t.string "composer"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "programme_id"
    t.index ["programme_id"], name: "index_works_on_programme_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "engagements", "artistes"
  add_foreign_key "engagements", "programmes"
  add_foreign_key "events", "engagements"
  add_foreign_key "tasks", "projects"
  add_foreign_key "works", "programmes"
end
