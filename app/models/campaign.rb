class Campaign < ActiveRecord::Base
  attr_accessible :name, :published, :number_of_matchdays, :win_points, :lose_points, :draw_points, :contest_type, :person_limit, :tournament_id, :allow_draw

  attr_accessor :allow_draw

  has_many  :competitions
  has_many  :users, through: :competitions
  belongs_to  :tournament

  validates :name, :number_of_matchdays, :win_points, :lose_points, :contest_type, presence: true

end