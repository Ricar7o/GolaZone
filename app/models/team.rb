class Team < ActiveRecord::Base
  attr_accessible :name, :home_field, :shape, :sport

  has_many  :matches
  has_many  :participations
  has_many  :tournaments, through: :participations

  validates :name, :home_field, presence: true
  validates :name, uniqueness: { scope: :sport }
end
