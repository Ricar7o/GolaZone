class PicksController < ApplicationController

  def create
    # Verify if the user is participating on this campaign
    competition = current_user.competitions.where(campaign_id: params[:campaign_id])
    unless competition.blank?
      # Grab this user's pick for this match
      current_pick = competition.first.picks.where(match_id: params[:match_id]).first
      # Verify if the user had already selected this particular result
      match_pick = !competition.first.picks.where(match_id: params[:match_id], selected_result: params[:selected_result]).first.blank?
      # Delete previous picks for this match
      current_pick.delete unless current_pick.blank?
      pick = competition.first.picks.new(match_id: params[:match_id], selected_result: params[:selected_result])
      # Only save the pick if the user selected another result.
      # If it was the same result, he wished to delete it and it has been done
      pick.save unless match_pick
    end
    render :json => { match: params[:match_id], result: params[:selected_result] }.to_json
  end
end
