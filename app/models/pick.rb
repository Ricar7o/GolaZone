class Pick < ActiveRecord::Base
  attr_accessible :selected_result, :competitor, :match

  belongs_to  :competitor
  belongs_to  :match

  validates :competitor, :match, :selected_result, presence: true
  validates :competitor, uniqueness: { scope: :match_id }
end
