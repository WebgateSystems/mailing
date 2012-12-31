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

ActiveRecord::Schema.define(:version => 20121226174816) do

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
    t.integer  "user_id"
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
    t.string   "encrypted_subject"
    t.text     "encrypted_body"
    t.string   "lang",              :default => "en"
    t.string   "inline_image"
    t.integer  "user_id"
    t.integer  "distribution_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
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
    t.integer  "user_id"
    t.string   "encrypted_email"
    t.string   "lang",              :default => "en"
    t.string   "salutation"
    t.string   "gender",            :default => "m"
    t.string   "encrypted_name"
    t.string   "encrypted_surname"
    t.string   "patronymic"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_configs", :force => true do |t|
    t.integer  "user_id"
    t.string   "lang"
    t.string   "server"
    t.integer  "port"
    t.string   "auth",                :default => "plain"
    t.boolean  "starttls"
    t.boolean  "tls"
    t.boolean  "ssl"
    t.string   "openssl_verify_mode"
    t.string   "encrypted_login"
    t.string   "encrypted_password"
    t.string   "encrypted_name"
    t.string   "encrypted_surname"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "user_configs", ["user_id"], :name => "index_user_configs_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                           :null => false
    t.string   "crypted_password",                                :null => false
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.boolean  "admin",                        :default => false
    t.boolean  "active",                       :default => true
    t.string   "encryption_salt"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
