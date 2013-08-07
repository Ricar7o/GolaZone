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

ActiveRecord::Schema.define(:version => 20130714004656) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.boolean  "published",           :default => true
    t.integer  "tournament_id"
    t.integer  "number_of_matchdays"
    t.integer  "win_points",          :default => 3
    t.integer  "lose_points",         :default => 0
    t.integer  "draw_points",         :default => 1
    t.string   "contest_type"
    t.integer  "person_limit"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "competitions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "competitions", ["user_id", "campaign_id"], :name => "index_competitions_on_user_id_and_campaign_id", :unique => true

  create_table "matches", :force => true do |t|
    t.integer  "week_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "match_time"
    t.boolean  "rescheduled",  :default => false
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "leg"
    t.float    "home_odds"
    t.float    "draw_odds"
    t.float    "away_odds"
    t.string   "venue"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "final_result"
  end

  add_index "matches", ["home_team_id", "away_team_id", "match_time"], :name => "index_matches_on_home_team_id_and_away_team_id_and_match_time", :unique => true

  create_table "participations", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "team_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "participations", ["tournament_id", "team_id"], :name => "index_participations_on_tournament_id_and_team_id", :unique => true

  create_table "picks", :force => true do |t|
    t.integer  "competition_id"
    t.integer  "match_id"
    t.string   "selected_result"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "picks", ["competition_id", "match_id"], :name => "index_picks_on_competition_id_and_match_id", :unique => true

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "home_field"
    t.string   "shape"
    t.string   "sport"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "short_name"
    t.string   "country"
    t.string   "logo"
  end

  add_index "teams", ["name", "sport"], :name => "index_teams_on_name_and_sport", :unique => true

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.string   "organizer"
    t.integer  "number_of_weeks"
    t.string   "sport"
    t.string   "competition_style"
    t.string   "season"
    t.string   "country"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "tournaments", ["name", "sport", "season"], :name => "index_tournaments_on_name_and_sport_and_season", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "language",               :default => "en"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "weeks", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "week_number"
    t.datetime "earliest_match",      :default => '9999-01-01 06:00:00'
    t.datetime "latest_match",        :default => '1970-01-01 00:00:00'
    t.boolean  "rescheduled_matches", :default => false
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  add_index "weeks", ["tournament_id", "week_number"], :name => "index_weeks_on_tournament_id_and_week_number", :unique => true

end
