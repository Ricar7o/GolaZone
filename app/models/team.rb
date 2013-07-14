class Team < ActiveRecord::Base
  attr_accessible :name, :home_field, :form, :additional_data

  has_many  :matches
  has_many  :participants
  has_many  :tournaments, through: :participants

  validates :name, :home_field, presence: true
end
