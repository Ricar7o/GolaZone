class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @tournaments = Tournament.open
  end

  def create
    @campaign = current_user.campaigns.new(params[:campaign])
    @campaign.draw_points = -1 if params[:campaign][:allow_draw] == "No"
    @campaign.competitions.build(user_id: current_user.id)
    @campaign.save
    @params = params
    redirect_to @campaign
  end

  def show
    @campaign = Campaign.find(params[:id])
    @tournament = @campaign.tournament
    @next_week = @campaign.tournament.weeks.where(week_number: @tournament.next_week).first
    @current_week = @campaign.tournament.weeks.where(week_number: @tournament.current_week).first
  end

end
