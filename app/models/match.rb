class Match < ActiveRecord::Base
  attr_accessible :week, :home_team, :away_team, :match_time, :postponed, :home_score, :away_score, :leg, :home_odds, :draw_odds, :away_odds, :venue

  belongs_to  :home_team, :class_name => "Team", :foreign_key => "home_team_id"
  belongs_to  :away_team, :class_name => "Team", :foreign_key => "away_team_id"
  belongs_to  :week # This is correct (we think)
  has_many    :picks

  validates :week_id, :home_team_id, :away_team_id, :match_time, :venue, presence: true
  validates :home_team_id, uniqueness: { scope: [:away_team_id, :match_time] }

  after_save :update_latest_match_in_week

  # After every match is created, verify if this is the latest match of the week.
  # If it is, update the weeks table with this match's time.
  # Only do this if this is a regularly scheduled match and hasn't been postponed.
  def update_latest_match_in_week
    if !self.postponed && self.match_time > week.latest_match
      week.latest_match = match_time
      week.save
    end
  end

end
