class PicksController < ApplicationController

  def create
    competition = current_user.competitions.where(campaign_id: params[:campaign_id])
    unless competition.blank?
      current_pick = competition.first.picks.where(match_id: params[:match_id]).first
      current_pick.delete unless current_pick.blank?
      pick = competition.first.picks.new(match_id: params[:match_id], selected_result: params[:selected_result])
      pick.save
    end
    render :json => { match: params[:match_id], result: params[:selected_result] }.to_json
  end
end
