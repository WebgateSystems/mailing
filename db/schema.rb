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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121224003531) do

  create_table "attachments", :force => true do |t|
    t.text     "description"
    t.string   "file"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "distributions", :force => true do |t|
    t.string   "title"
    t.integer  "status_id",  :default => 1
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "fileattaches", :force => true do |t|
    t.text     "description"
    t.string   "file"
    t.integer  "attachable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "fileattaches", ["attachable_id"], :name => "index_fileattaches_on_attachable_id"

  create_table "letters", :force => true do |t|
    t.text     "body"
    t.string   "lang",            :default => "en"
    t.string   "inline_image"
    t.integer  "distribution_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "mailing_recipients", :force => true do |t|
    t.integer  "distribution_id"
    t.integer  "recipient_id"
    t.integer  "letter_id"
    t.integer  "email_status_id", :default => 7
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "recipients", :force => true do |t|
    t.string   "email"
    t.string   "lang",       :default => "en"
    t.string   "gender",     :default => "male"
    t.string   "salutation"
    t.string   "name"
    t.string   "patronymic"
    t.string   "surname"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
