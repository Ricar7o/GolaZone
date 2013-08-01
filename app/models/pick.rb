class Pick < ActiveRecord::Base
  attr_accessible :selected_result, :competition_id, :match_id

  belongs_to  :competition
  belongs_to  :match

  validates :competition_id, :match_id, :selected_result, presence: true
  validates :competition_id, uniqueness: { scope: :match_id }
end
