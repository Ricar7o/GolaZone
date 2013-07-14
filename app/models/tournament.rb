class Tournament < ActiveRecord::Base
  attr_accessible :name, :organizer, :number_of_matchdays, :sport, :competition_style, :season, :country

  has_many  :campaigns
  has_many  :participants
  has_many  :teams, through: :participants
  has_many  :matchdays

  validates :name, :organizer, :number_of_matchdays, :sport, :competition_style, :season, :country, presence: true
  validates :name, uniqueness: { scope: [:sport, :season] }
end
