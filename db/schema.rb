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

ActiveRecord::Schema.define(version: 20180125154506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elections", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elections_voters", id: false, force: :cascade do |t|
    t.integer "election_id",    null: false
    t.integer "voter_id",       null: false
    t.string  "vote_method"
    t.integer "vote_method_id"
  end

  add_index "elections_voters", ["election_id", "voter_id"], name: "index_elections_voters_on_election_id_and_voter_id", using: :btree
  add_index "elections_voters", ["voter_id", "election_id"], name: "index_elections_voters_on_voter_id_and_election_id", using: :btree

  create_table "vote_methods", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voters", force: :cascade do |t|
    t.string   "un"
    t.string   "party"
    t.string   "dp"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "suffix_name"
    t.string   "ascension"
    t.date     "reg_date"
    t.date     "condition_date"
    t.date     "org_reg_date"
    t.date     "dist_date"
    t.string   "residence_address"
    t.string   "residence_city"
    t.string   "residence_zip"
    t.string   "mailing_address1"
    t.string   "mailing_address2"
    t.string   "mailing_address3"
    t.string   "mailing_city"
    t.string   "mailing_state"
    t.string   "mailing_zip"
    t.string   "mailing_country"
    t.string   "gender"
    t.string   "cc"
    t.string   "vh1"
    t.string   "vh2"
    t.string   "vh3"
    t.string   "vh4"
    t.string   "vh5"
    t.string   "vh6"
    t.string   "vh7"
    t.string   "vh8"
    t.string   "vh9"
    t.string   "vh10"
    t.string   "vh11"
    t.string   "vh12"
    t.string   "vh13"
    t.string   "vh14"
    t.string   "vh15"
    t.string   "vh16"
    t.string   "msbid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
