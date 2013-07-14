class Campaign < ActiveRecord::Base
  attr_accessible :name, :published, :number_of_matchdays, :win_points, :lose_points, :draw_points, :contest_type, :person_limit

  has_many  :competitors
  has_many  :users, through: :competitors
  belongs_to  :tournament
end