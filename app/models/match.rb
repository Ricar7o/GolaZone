class Match < ActiveRecord::Base
  attr_accessible :matchday, :home_team, :away_team, :match_date, :match_time, :home_score, :away_score, :leg, :home_odds, :draw_odds, :away_odds, :venue

  belongs_to :home_team, :class_name => "Team"
  belongs_to :away_team, :class_name => "Team"
  belongs_to  :matchday
  has_many    :picks

  validates :matchday, :home_team, :away_team, :match_date, :venue, presence: true
end
