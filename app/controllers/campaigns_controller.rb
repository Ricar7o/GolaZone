class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
    @tournaments = Tournament.find(:all, :conditions => ['season LIKE ?', '%' + Time.now.year.to_s + '%'])
    

    # puts params
    # if !params[:campaign][tournament_id].nil?
    #   tournament_season_array = params[:campaign][tournament_id].split(': ')
    #   @tournament = Tournament.where(name: tournament_season_array[0], season: tournament_season_array[1])
    # end

  end

  def create
    puts params["tournament"]
    puts params["tournament"].inspect
    puts params["season"]
    puts params["season"].inspect
    @tournament = Tournament.where(name: params["tournament"], season: params["season"])
    render action: 'new'
  end

end
