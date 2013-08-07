class TournamentsController < ApplicationController

  def calculate_weeks_left
    @tournament = Tournament.find(params[:id])
    render 'calculate_weeks_left', layout: false
  end

end
