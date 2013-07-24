class Tournament < ActiveRecord::Base
  attr_accessible :name, :organizer, :number_of_matchdays, :sport, :competition_style, :season, :country

  has_many  :campaigns
  has_many  :participants
  has_many  :teams, through: :participants
  has_many  :matchdays

  validates :name, :organizer, :number_of_matchdays, :sport, :competition_style, :season, :country, presence: true
  validates :name, uniqueness: { scope: [:sport, :season] }

  def matchdays_left
    latest_match = Time.now
    self.matchdays.count.times do |i|
      matchday = self.matchdays.where(week_number: i+1).first
      if matchday.matches.count > 0
        latest_match = matchday.matches.order('match_time DESC').first.match_time
        return self.number_of_matchdays - i if latest_match > Time.new(2013, 5, 10) # ---> This time needs to be changed to the current time once playing live
      end
    end
    return 0 
  end

end
