# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150505051838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "albums", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "allergies", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_occured"
    t.integer  "author_id"
  end

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.integer  "specialist_id"
    t.string   "name"
    t.text     "notes"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "blood_pressures", force: true do |t|
    t.integer  "user_id"
    t.integer  "author_id"
    t.integer  "systolic"
    t.integer  "diastolic"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "conditions", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.boolean  "make_public"
    t.date     "date_occured"
    t.integer  "author_id"
  end

  create_table "conversations", force: true do |t|
    t.integer  "user_id"
    t.integer  "other_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datapoints", force: true do |t|
    t.boolean  "taken"
    t.integer  "tracker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "amount"
    t.string   "data_name"
  end

  create_table "diagnoses", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "doctor_visits", force: true do |t|
    t.integer  "user_id"
    t.text     "notes"
    t.integer  "doctor_id"
    t.string   "location"
    t.string   "reason"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doctor"
    t.date     "date_occured"
    t.integer  "author_id"
  end

  create_table "documents", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id", using: :btree

  create_table "droplets", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.text     "body_html"
    t.text     "body"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episodes", ["user_id"], name: "index_episodes_on_user_id", using: :btree

  create_table "exercises", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fitnesses", force: true do |t|
    t.integer  "user_id"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "friendships", ["state"], name: "index_friendships_on_state", using: :btree

  create_table "galleries", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.integer  "doctor_visit_id"
    t.integer  "post_id"
    t.integer  "symptom_id"
    t.integer  "lab_result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "goal_posts", force: true do |t|
    t.integer  "user_id"
    t.text     "words"
    t.float    "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "goal_id"
  end

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.string   "number_name"
    t.boolean  "use_number"
    t.boolean  "use_photo"
    t.boolean  "use_words"
    t.float    "number_goal"
    t.boolean  "use_goal_date"
    t.date     "goal_date"
    t.string   "text"
    t.string   "category"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed"
  end

  create_table "handshakes", force: true do |t|
    t.string   "relationship_name"
    t.string   "relationship_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "followed_id"
  end

  add_index "handshakes", ["followed_id"], name: "index_handshakes_on_followed_id", using: :btree
  add_index "handshakes", ["follower_id", "followed_id"], name: "index_handshakes_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "handshakes", ["follower_id"], name: "index_handshakes_on_follower_id", using: :btree

  create_table "heights", force: true do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "immunizations", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "b_validated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "validator_id"
    t.string   "validation_url"
    t.string   "rec_age"
    t.string   "rec_dose"
    t.date     "date_taken"
    t.date     "date_occured"
    t.integer  "author_id"
  end

  create_table "ko_medication_reviews", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "is_anonymous"
    t.integer  "rating"
    t.integer  "condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ko_medications", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imageurl"
  end

  create_table "medications", force: true do |t|
    t.integer  "user_id"
    t.text     "name"
    t.text     "dosage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "finished"
    t.string   "prescribed_by"
    t.string   "filled_by"
    t.string   "notes"
    t.date     "date_occured"
    t.string   "other_dosage"
    t.integer  "author_id"
  end

  add_index "medications", ["user_id"], name: "index_medications_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "content"
    t.boolean  "b_read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.boolean  "b_read"
    t.string   "content"
    t.string   "imageurl"
    t.string   "notificationurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "page_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "permissible_user_id"
    t.integer  "condition_id"
    t.integer  "goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "b_write_access"
    t.boolean  "b_full_write_access"
    t.boolean  "b_full_view_access"
    t.integer  "tracker_id"
    t.integer  "allergy_id"
    t.integer  "album_id"
    t.integer  "medication_id"
  end

  create_table "pharmacies", force: true do |t|
    t.integer  "user_id"
    t.integer  "medication_id"
    t.string   "name"
    t.boolean  "b_current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "gallery_id"
    t.string   "image"
    t.string   "gallery_token"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_visit_id"
    t.integer  "symptom_id"
    t.integer  "medication_id"
    t.integer  "immunization"
    t.integer  "allergy"
    t.integer  "author_id"
  end

  create_table "pictures", force: true do |t|
    t.integer  "album_id"
    t.integer  "user_id"
    t.string   "caption"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  add_index "pictures", ["album_id"], name: "index_pictures_on_album_id", using: :btree
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "condition_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

  create_table "statuses", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "document_id"
  end

  add_index "statuses", ["user_id"], name: "index_statuses_on_user_id", using: :btree

  create_table "symptoms", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.date     "date_occured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "trackers", force: true do |t|
    t.integer  "user_id"
    t.integer  "condition_id"
    t.integer  "medication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "metric_id"
    t.boolean  "b_bar_chart"
    t.string   "data_name"
  end

  create_table "treatments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "user_friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "user_friendships", ["state"], name: "index_user_friendships_on_state", using: :btree
  add_index "user_friendships", ["user_id", "friend_id"], name: "index_user_friendships_on_user_id_and_friend_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
    t.string   "language"
    t.string   "ethnicity"
    t.text     "address"
    t.datetime "birthday"
    t.date     "date_of_birth"
    t.string   "phone_number"
    t.string   "gender"
    t.string   "doner"
    t.string   "bloodtype"
    t.text     "bio"
    t.string   "role"
    t.string   "imageurl"
    t.boolean  "b_use_btn_labels"
    t.string   "wallpaper_url"
    t.boolean  "b_use_wallpaper"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["profile_name"], name: "index_users_on_profile_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weights", force: true do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
