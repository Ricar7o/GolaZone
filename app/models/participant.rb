class Participant < ActiveRecord::Base
  attr_accessible :team, :tournament

  belongs_to  :team
  belongs_to  :tournament
end