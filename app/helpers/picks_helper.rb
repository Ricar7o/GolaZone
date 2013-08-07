module PicksHelper

  def picked_result?(match_id, result)
    !current_user.competitions.where(campaign_id: @campaign.id).first.picks.where(match_id: match_id, selected_result: result).blank?
  end
end
