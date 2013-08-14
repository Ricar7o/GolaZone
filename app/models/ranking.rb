class Ranking < ActiveRecord::Base
  attr_accessible :competition_id, :week_id, :position, :score, :total

  belongs_to    :competition
  belongs_to    :week

  validates     :competition_id, uniqueness: { scope: :week_id }

  #
  #
  #
  #
  #
  #
  def last_week_total(competition, week_number)
    if competition.rankings.where(week_id: competition.campaign.find_week_id(week_number-1)).first.nil?
      return 0
    else
      competition.rankings.where(week_id: competition.campaign.find_week_id(week_number-1)).first.total
    end
  end

end
