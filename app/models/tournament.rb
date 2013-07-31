class Tournament < ActiveRecord::Base
  attr_accessible :name, :organizer, :number_of_weeks, :sport, :competition_style, :season, :country

  has_many  :campaigns
  has_many  :participations
  has_many  :teams, through: :participations
  has_many  :weeks

  validates :name, :organizer, :number_of_weeks, :sport, :competition_style, :season, :country, presence: true
  validates :name, uniqueness: { scope: [:sport, :season] }

  # Ongoing tournaments are those where the LATEST match of the LAST week hasn't passed
  # Ongoing is meant to be used when displaying tournament information and matches being played
  scope :ongoing, -> {
    joins(:weeks).where('weeks.week_number = tournaments.number_of_weeks AND ? < weeks.latest_match', [Time.now])
    # The last portion of the query gets passed onto the place where the question mark is inside the query
  }

  # Open tournaments are those where the EARLIEST match of the LAST week hasn't passed
  # Open tournaments are meant to be used for the creation of a new campaign
  scope :open, -> {
    joins(:weeks).where('weeks.week_number = tournaments.number_of_weeks AND ? < weeks.earliest_match', [Time.now])
    # The last portion of the query gets passed onto the place where the question mark is inside the query
  }

  # Calculates the number of weeks left in a tournament from this moment
  #
  # Returns the integer number of weeks left
  def weeks_left
    weeks.each do |week|
      return number_of_weeks - week.week_number + 1 if week.latest_match > Time.now
    end
  end


end
