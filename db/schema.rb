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

ActiveRecord::Schema.define(:version => 20130724144706) do

  create_table "app_versions", :force => true do |t|
    t.string   "app_name"
    t.string   "version"
    t.string   "short_version"
    t.integer  "beta_version"
    t.string   "icon_url"
    t.datetime "release_date"
    t.text     "change_log"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "app_versions", ["app_name"], :name => "index_app_versions_on_app_name", :unique => true
  add_index "app_versions", ["beta_version"], :name => "index_app_versions_on_beta_version", :unique => true
  add_index "app_versions", ["release_date"], :name => "index_app_versions_on_release_date", :unique => true
  add_index "app_versions", ["short_version"], :name => "index_app_versions_on_short_version", :unique => true
  add_index "app_versions", ["version"], :name => "index_app_versions_on_version", :unique => true

  create_table "apps", :force => true do |t|
    t.string   "bundle_id",    :default => "", :null => false
    t.integer  "last_version", :default => 0,  :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "apps", ["bundle_id"], :name => "index_apps_on_bundle_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
