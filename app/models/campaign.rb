class Campaign < ActiveRecord::Base
  attr_accessible :name, :published, :number_of_matchdays, :win_points, :lose_points, :draw_points, :contest_type, :person_limit, :tournament_id, :allow_draw

  attr_accessor :allow_draw

  has_many    :competitions
  has_many    :users, through: :competitions
  belongs_to  :tournament
  has_many    :invitations

  validates :name, :number_of_matchdays, :win_points, :lose_points, :contest_type, presence: true

  # Generates a leaderboard for the campaign up to week_number
  #
  # week_number - the Integer number of the week
  #
  # Returns the leaderboard
  def generate_week_leaderboard(week_number)
    self.competitions.each do |comp|
      # comp.picks - all picks by a user in a campaign
      # w = Week.where(week_number: week_number).first
      # w.latest_match
      # get picks from matches that belong to a week before this one, and the match has already been played.

    end
  end

  # Generates a leaderboard for the campaign up to now
  #
  # Returns the live leaderboard
  def generate_live_leaderboard

  end

end