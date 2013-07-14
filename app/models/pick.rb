class Pick < ActiveRecord::Base
  attr_accessible :selected_result, :competitor, :match

  belongs_to  :competitor
  belongs_to  :match

  validates :competitor_id, :match_id, :selected_result, presence: true
  validates :competitor_id, uniqueness: { scope: :match_id }
end
