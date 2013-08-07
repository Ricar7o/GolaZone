module CampaignsHelper

  def tournaments_for_select
    @tournaments.map { |t| [t.name + ": " + t.season, t.id] }
  end

end
