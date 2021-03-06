class Participation < ActiveRecord::Base
  attr_accessible :team_id, :tournament_id

  belongs_to  :team
  belongs_to  :tournament

  validates :team_id, :tournament_id, presence: true
  validates :team_id, uniqueness: { scope: :tournament_id }
end
