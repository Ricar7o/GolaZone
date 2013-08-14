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
    # If week is in the future, don't give me answer
    self.competitions.each do |comp|
      # get picks from matches that belong to the week, and the match has already been played.
      ranking = Ranking.new(competition_id: comp.id, week_id: find_week_id(week_number))
      ranking.score = Pick.count_correct(comp.picks.where(match_id: Week.find(self.find_week_id(week_number)).matches)) # ======= < This call to the DB can be made outside of the block ======
      last_total = ranking.last_week_total(comp, week_number)
      # last_total = comp.rankings.where(week_id: self.find_week_id(week_number-1)).first.total || 0
      ranking.total = last_total + ranking.score
      ranking.save
    end
  end

  # Determine if all rankings for week_number of this campaign have been generated
  # It depends on the amount of Ranking objects that already exist for this campaign on week_number
  #
  # week_number - the Integer number of the week
  #
  # Returns true if the number of Rankings in the DB for this week equal the number of competitors in this campaign
  def all_rankings_generated?(week_number)
    Ranking.where(week_id: find_week_id(week_number), competition_id: Competition.where(campaign_id: self.id).pluck(:id)).count == self.competitions.count
  end

  # Finds the id of the Week that has a week number of week_number in
  # the tournament that this campaign is referencing
  #
  # week_number - the Integer number of the week
  #
  # Returns the Integer id of the Week
  def find_week_id(week_number)
    self.tournament.weeks.where(week_number: week_number).first.id
  end

end