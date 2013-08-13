class Invitation < ActiveRecord::Base
  attr_accessible :user_id, :to_email, :to_name, :campaign_id, :message

  belongs_to  :user
  belongs_to  :campaign

  validates   :to_email, uniqueness: {scope: :campaign_id}
end
