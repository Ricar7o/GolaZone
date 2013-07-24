class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @tournaments = Tournament.find(:all, :conditions => ['season LIKE ?', '%' + Time.now.year.to_s + '%'])
    
    # vvv This code is relevant after the selection of the tournament vvv
    tournament_selected = params[:tournament]
    season_selected = params[:season]

    @params = params

    # raise params.inspect

    if tournament_selected # This comes through the params after the tournament is selected
      @tournament = Tournament.where(name: tournament_selected, season: season_selected).first #Variable with the tournament selected to dig into the matchdays
      @matchdays_left = @tournament.matchdays_left
    end

  end

  def create
    puts params["tournament"]
    puts params["tournament"].inspect
    puts params["season"]
    puts params["season"].inspect
    @tournament = Tournament.where(name: params["tournament"], season: params["season"])
    # render action: 'new'
  end

end
