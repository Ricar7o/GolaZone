class Matchday < ActiveRecord::Base
  attr_accessible :week_number

  belongs_to  :tournament
end
