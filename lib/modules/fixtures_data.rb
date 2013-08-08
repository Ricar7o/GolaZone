module FixturesData
  
  require 'httparty'

  # Lists all of the fixtures by the competition and time window selected

  class Fixtures

    # These are the variable options for the API request.  

      COMPETITION = "premier-league"
      API_KEY = "free"
      FROM_DATE = "2013-08-17"
      TO_DATE = "2013-08-23"
      TIMEZONE = "Europe/London"
      LIMIT = 10

    def self.get_fixtures

      fixture_response= HTTParty.get("http://api.statsfc.com/#{COMPETITION}/fixtures.json?key=#{API_KEY}&from=#{FROM_DATE}&to=#{TO_DATE}&timezone=#{TIMEZONE}&limit=#{LIMIT}")

      fixture_response.each do |item|
        puts "#{item["competition"]}: #{item["date"]}"
        puts "#{item["home"]} vs. #{item["away"]}"
      end

    end

  end 
  
end
