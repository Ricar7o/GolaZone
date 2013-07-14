class Tournament < ActiveRecord::Base
  attr_accessible :name, :organizer, :number_of_matchdays, :sport, :competition_style, :season

  has_many  :campaigns
  has_many  :participants
  has_many  :teams, through: :participants
  has_many  :matchdays
end
