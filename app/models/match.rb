class Match < ActiveRecord::Base
  attr_accessible :match_date, :match_time, :home_score, :away_score, :leg, :odds, :venue

  has_one :home_team, :class_name => "Team"
  has_one :away_team, :class_name => "Team"
end
