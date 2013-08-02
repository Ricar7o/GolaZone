class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @tournaments = Tournament.open
    # @tournaments = Tournament.find(:all, :conditions => ['season LIKE ?', '%' + Time.now.year.to_s + '%'])

    @params = params # Just for debugging purposes
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
  end

  def calculate_weeks_left
    @tournament = Tournament.find(params[:tournament_id]) if params[:tournament_id]
    render 'calculate_weeks_left', layout: false
  end

end
