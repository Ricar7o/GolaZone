class Pick < ActiveRecord::Base
  attr_accessible :selected_result, :competitor, :match

  belongs_to  :competition
  belongs_to  :match

  validates :competition_id, :match_id, :selected_result, presence: true
  validates :competition_id, uniqueness: { scope: :match_id }
end
