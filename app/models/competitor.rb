class Competitor < ActiveRecord::Base
  attr_accessible :user, :campaign

  belongs_to  :user
  belongs_to  :campaign
end
