class Pick < ActiveRecord::Base
  attr_accessible :selected_result, :competition_id, :match_id

  belongs_to  :competition
  belongs_to  :match

  validates :competition_id, :match_id, :selected_result, presence: true
  validates :competition_id, uniqueness: { scope: :match_id }

  # Determines if the pick was correct by comparing it to the final result of the match
  #
  # Returns true if the pick was correct
  def is_correct?
    self.match.final_result == selected_result
  end

  # Calculates the number of correct picks from an array of picks
  #
  # picks_array - the array of picks
  #
  # Returns the Integer number of correct picks
  def self.count_correct(picks_array)
    counter = 0
    picks_array.each do |pick|
      counter += 1 if pick.is_correct?
    end
    return counter
    # To make it an array of the results
    # picks_results = picks_array.map do |pick|
    #   pick.is_correct?
    # end
  end
end
