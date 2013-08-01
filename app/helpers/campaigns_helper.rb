module CampaignsHelper

  def tournaments_for_select
    @tournaments.map { |t| [t.name + ": " + t.season, t.id] }
  end

  def weeks_for_select
    @tournament.weeks_left
  end

end
