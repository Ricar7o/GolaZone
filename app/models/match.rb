class Match < ActiveRecord::Base
  attr_accessible :matchday, :home_team, :away_team, :match_time, :home_score, :away_score, :leg, :home_odds, :draw_odds, :away_odds, :venue

  belongs_to  :home_team, :class_name => "Team", :foreign_key => "home_team_id"
  belongs_to  :away_team, :class_name => "Team", :foreign_key => "away_team_id"
  belongs_to  :matchday # This is correct (we think)
  has_many    :picks

  validates :matchday_id, :home_team_id, :away_team_id, :match_time, :venue, presence: true
  validates :home_team_id, uniqueness: { scope: [:away_team_id, :match_time] }
end
