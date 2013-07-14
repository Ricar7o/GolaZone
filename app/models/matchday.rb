class Matchday < ActiveRecord::Base
  attr_accessible :week_number

  belongs_to  :tournament
  has_many    :matches

  validates :tournament, :match, :week_number, presence: true
end
