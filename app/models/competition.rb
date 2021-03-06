class Competition < ActiveRecord::Base
  attr_accessible :user_id, :campaign_id

  belongs_to  :user
  belongs_to  :campaign
  has_many    :picks
  has_many    :rankings

  validates   :user_id, uniqueness: { scope: :campaign_id }

end
