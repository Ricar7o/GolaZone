class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @tournaments = Tournament.open
    # @tournaments = Tournament.find(:all, :conditions => ['season LIKE ?', '%' + Time.now.year.to_s + '%'])

    @params = params # Just for debugging purposes
  end

  def create
    puts params["tournament"]
    puts params["tournament"].inspect
    puts params["season"]
    puts params["season"].inspect
    @tournament = Tournament.where(name: params["tournament"], season: params["season"])
    # render action: 'new'
  end

  def calculate_weeks_left
    if params[:tournament] && params[:season]
      tournament_selected = params[:tournament]
      season_selected = params[:season]
      @tournament = Tournament.where(name: tournament_selected, season: season_selected).first #Variable with the tournament selected to dig into the matchdays
      # @weeks_left = @tournament.weeks_left
    end
    render 'calculate_weeks_left', layout: false
  end

end
