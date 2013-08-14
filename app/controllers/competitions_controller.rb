class CompetitionsController < ApplicationController
  def index
    @user_competing = !@campaign.competitions.where(user_id: current_user).blank?
  end

  def create
    @competitions = Compentition.where(user_id: current_user.id)
    @competition = Competition.new(user_id: current_user.id, campaign_id: params[:id])
    @competition.save
  end

end
