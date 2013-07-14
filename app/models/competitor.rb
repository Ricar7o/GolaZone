class Competitor < ActiveRecord::Base
  attr_accessible :user, :campaign

  belongs_to  :user
  belongs_to  :campaign
  has_many    :picks

  validates   :user, :campaign, presence: true
  validates   :user, uniqueness: { scope: :campaign_id }
  
end
