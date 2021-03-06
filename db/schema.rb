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

ActiveRecord::Schema.define(:version => 20121122150331) do

  create_table "brewers", :force => true do |t|
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
    t.string   "name"
    t.string   "location"
    t.integer  "rating"
    t.string   "profile"
  end

  add_index "brewers", ["email"], :name => "index_brewers_on_email", :unique => true
  add_index "brewers", ["reset_password_token"], :name => "index_brewers_on_reset_password_token", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.float    "quantity"
    t.string   "unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interested_brewers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "interested_brewers", ["email"], :name => "index_interested_brewers_on_email", :unique => true

  create_table "recipe_hierarchies", :id => false, :force => true do |t|
    t.integer "ancestor_id",   :null => false
    t.integer "descendant_id", :null => false
    t.integer "generations",   :null => false
  end

  add_index "recipe_hierarchies", ["ancestor_id", "descendant_id"], :name => "index_recipe_hierarchies_on_ancestor_id_and_descendant_id", :unique => true
  add_index "recipe_hierarchies", ["descendant_id"], :name => "index_recipe_hierarchies_on_descendant_id"

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "style"
    t.string   "picture"
    t.float    "o_gravity"
    t.float    "f_gravity"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "parent_id"
  end

end
