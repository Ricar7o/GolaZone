class Campaign < ActiveRecord::Base
  attr_accessible :name, :published, :number_of_matchdays, :win_points, :lose_points, :draw_points, :contest_type, :person_limit, :tournament_id, :allow_draw

  attr_accessor :allow_draw

  has_many    :competitions
  has_many    :users, through: :competitions
  belongs_to  :tournament
  has_many    :invitations

  validates :name, :number_of_matchdays, :win_points, :lose_points, :contest_type, presence: true

  # Generates the rankings for the campaign up to week_number
  #
  # week_number - the Integer number of the week
  #
  # Returns the leaderboard
  def generate_rankings(week_number)
    self.competitions.each do |comp|
      # comp.picks - all picks by a user in a campaign
      # w = Week.where(week_number: week_number).first
      # w.latest_match
      # get picks from matches that belong to a week before this one, and the match has already been played.
      # comp.picks.includes(:match).where(match_id: Week.find(week_number).matches)
    end
  end

  def all_rankings_generated?(week_number)
    Ranking.where(week_id: self.tournament.weeks.where(week_number: week_number).first.id, competition_id: Competition.where(campaign_id: self.id).pluck(:id)).count == self.competitions.count
  end

end