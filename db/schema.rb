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

ActiveRecord::Schema.define(version: 2020_05_29_104638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "artistes", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "passportnumber"
    t.date "passportdelivered"
    t.date "passportexpire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
    t.text "image_data"
    t.string "flightcompany"
    t.string "birthplacecity"
    t.string "birthplacedepartment"
    t.string "birthplacecountry"
    t.string "nationality"
    t.string "familystatus"
    t.string "maidenname"
    t.string "socialsecurity"
    t.string "congesspectacles"
    t.string "audiens"
    t.text "biography"
    t.text "address"
    t.string "instrument"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "address2"
    t.string "codepostal"
    t.string "ville"
    t.string "cedex"
    t.string "pays"
  end

  create_table "contacts_engagements", id: false, force: :cascade do |t|
    t.bigint "engagement_id", null: false
    t.bigint "contact_id", null: false
    t.string "fonction"
    t.boolean "maincontact"
    t.index ["contact_id", "engagement_id"], name: "index_contacts_engagements_on_contact_id_and_engagement_id"
    t.index ["engagement_id", "contact_id"], name: "index_contacts_engagements_on_engagement_id_and_contact_id"
  end

  create_table "engagements", force: :cascade do |t|
    t.string "title"
    t.date "startengagement"
    t.date "endengagement"
    t.boolean "contract"
    t.boolean "hotel"
    t.boolean "taxi"
    t.boolean "sent"
    t.boolean "rehearsals"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "programme_id"
    t.boolean "voyages"
    t.bigint "artiste_id"
    t.string "status"
    t.string "category"
    t.index ["artiste_id"], name: "index_engagements_on_artiste_id"
    t.index ["programme_id"], name: "index_engagements_on_programme_id"
  end

  create_table "engagements_structures", id: false, force: :cascade do |t|
    t.integer "engagement_id"
    t.integer "structure_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "engagement_id"
    t.index ["engagement_id"], name: "index_events_on_engagement_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "instrument"
    t.bigint "engagement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engagement_id"], name: "index_partners_on_engagement_id"
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

  create_table "responsabilities", force: :cascade do |t|
    t.string "fonction"
    t.bigint "contact_id", null: false
    t.bigint "structure_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_responsabilities_on_contact_id"
    t.index ["structure_id"], name: "index_responsabilities_on_structure_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "title"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address2"
    t.string "postalcode"
    t.string "city"
    t.string "cedex"
    t.string "country"
    t.string "phone"
    t.string "email"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "done"
    t.bigint "project_id", null: false
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
    t.bigint "programme_id"
    t.index ["programme_id"], name: "index_works_on_programme_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "engagements", "artistes"
  add_foreign_key "engagements", "programmes"
  add_foreign_key "events", "engagements"
  add_foreign_key "partners", "engagements"
  add_foreign_key "responsabilities", "contacts"
  add_foreign_key "responsabilities", "structures"
  add_foreign_key "tasks", "projects"
  add_foreign_key "works", "programmes"
end
