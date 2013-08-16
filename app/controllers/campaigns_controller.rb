class CampaignsController < ApplicationController

  before_filter :authenticate_user!,    :only => [:new, :create, :destroy]

  def new
    @campaign = Campaign.new
    @tournaments = Tournament.open
  end

  def index
    redirect_to new_campaign_path
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
    @next_week = 0 if @next_week.blank?
    @current_week = @campaign.tournament.weeks.where(week_number: @tournament.current_week).first
    @user_competing = !@campaign.competitions.where(user_id: current_user).blank?
    @user_invited = !@campaign.invitations.where(to_email: current_user.email).blank? if user_signed_in?

    redirect_to root_path, alert: "You are not authorized to see this campaign" unless @campaign && (@user_competing || @user_invited || @campaign.published)

    @picks = current_user.competitions.where(campaign_id: @campaign.id).first.picks if @user_competing
    @invitation = @campaign.invitations.build(user_id: current_user.id) if user_signed_in?
    unless @campaign.all_rankings_generated?(@tournament.current_week) #&& Time.now > @current_week.latest_match
      @campaign.generate_rankings(@tournament.current_week)
    end
    @rankings = Ranking.where(competition_id: @campaign.competitions, week_id: Week.find(@current_week))#.order("score DESC")
  end

end
