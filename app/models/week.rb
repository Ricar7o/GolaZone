class Week < ActiveRecord::Base
  attr_accessible :week_number, :earliest_match, :latest_match, :rescheduled_matches

  belongs_to  :tournament
  has_many    :matches

  validates :tournament_id, :week_number, presence: true
  validates :tournament_id, uniqueness: { scope: :week_number }
end
