class Week < ActiveRecord::Base
  attr_accessible :week_number, :earliest_match, :latest_match, :rescheduled_matches

  belongs_to  :tournament
  has_many    :matches

  validates :tournament_id, :week_number, presence: true
  validates :tournament_id, uniqueness: { scope: :week_number }

  # After every match is created, verify if this is the latest match of the week.
  # If it is, update the weeks table with this match's time.
  # Only do this if this is a regularly scheduled match and hasn't been rescheduled.
  def update_latest_match(match)
    if !match.rescheduled && match.match_time > self.latest_match
      self.latest_match = match.match_time
      # week.save
    end
  end

  # After every match is created, verify if this is the earliest match of the week.
  # If it is, update the weeks table with this match's time.
  # Only do this if this is a regularly scheduled match and hasn't been rescheduled.
  def update_earliest_match(match)
    if !match.rescheduled && match.match_time < self.earliest_match
      self.earliest_match = match.match_time
      # week.save
    end
  end

  def update_reschedules(match)
    self.rescheduled_matches = self.rescheduled_matches || match.rescheduled
    # week.save
  end

end