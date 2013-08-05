class Match < ActiveRecord::Base
  attr_accessible :week_id, :home_team, :away_team, :match_time, :rescheduled, :home_score, :away_score, :leg, :home_odds, :draw_odds, :away_odds, :venue

  belongs_to  :home_team, :class_name => "Team", :foreign_key => "home_team_id"
  belongs_to  :away_team, :class_name => "Team", :foreign_key => "away_team_id"
  belongs_to  :week # This is correct (we think)
  has_many    :picks

  validates :week_id, :home_team_id, :away_team_id, :match_time, :venue, presence: true
  validates :home_team_id, uniqueness: { scope: [:away_team_id, :match_time] }

  after_save :update_week

  def update_week
    week.update_latest_match(self)
    week.update_earliest_match(self)
    week.update_reschedules(self)
    week.save
  end

end
