class PicksController < ApplicationController

  def create
    competition = current_user.competitions.where(campaign_id: params[:campaign_id])
    unless competition.blank?
      current_pick = competition.first.picks.where(match_id: params[:match_id]).first
      match_pick = !competition.first.picks.where(match_id: params[:match_id], selected_result: params[:selected_result]).first.blank?
      current_pick.delete unless current_pick.blank?
      pick = competition.first.picks.new(match_id: params[:match_id], selected_result: params[:selected_result])
      pick.save unless match_pick
    end
    render :json => { match: params[:match_id], result: params[:selected_result] }.to_json
  end
end
