class Ranking < ActiveRecord::Base
  attr_accessible :competition_id, :week_id, :position, :score, :total

  belongs_to    :competition
  belongs_to    :week

  validates     :competition_id, uniqueness: { scope: :week_id }
end
