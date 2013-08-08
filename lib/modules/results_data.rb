module ResultsData

  require 'httparty'

  # This gets the results of a tournament's games for a specified period of time.  

  class Results

    # This gets the winner of each game of a tournament by evaluation whether it did or did not go to penalty kicks and then deciding the winner based the number of fulltime goals or penalty kick goals. In all cases, [0] is the home team, while [1] is the away team.  The total_pens exists because the JSON always returns the score of the penalty kicks, even if there weren't any.  So we have to ask if there are any and then we decide if it should decide the score of the game.

    # These are the variable options for the API request.  

      COMPETITION = "league-cup"
      API_KEY = "free"
      YEAR_NAME = "2012/2013"
      FROM_DATE = "2012-12-11"
      TO_DATE = "2012-12-19"
      TIMEZONE = "Europe/London"
      LIMIT = 10


    def self.get_matches
      todays_matches = Match.where("DATE(match_time) = ?", Date.today)
      # Get the matches from the day
      # Get the teams, competition and time
      # Put those objects in a data structure
      # Loop through those objects and make a get_results request
      # Delay that request until three hours after match time
    end

    def self.get_results

      # This is the call to the API

      league_response= HTTParty.get("http://api.statsfc.com/#{COMPETITION}/results.json?key=#{API_KEY}&year=#{YEAR_NAME}&from=#{FROM_DATE}&to=#{TO_DATE}&timezone=#{TIMEZONE}&limit=#{LIMIT}")

      league_response.each do |item|

        home_team = item["home"]
        away_team = item["away"]
        home_goals = item["fulltime"][0]
        away_goals = item["fulltime"][1]
        home_pens = item["penalties"][0] 
        away_pens = item["penalties"][1]
        total_pens = home_pens + away_pens
        home_win = "H"
        away_win = "A"
        draw = "D"

        if noPens?(total_pens) && homeRegWin?(home_goals, away_goals)
          final_result = home_win
        elsif noPens?(total_pens) && awayRegWin?(home_goals, away_goals)
          final_result = away_win
        elsif noPens?(total_pens) && draw?(home_goals, away_goals)
          final_result = draw
        elsif hasPens?(total_pens) && homePKwin?(home_pens, away_pens)
          final_result = home_win
        elsif hasPens?(total_pens) && awayPKwin?(home_pens, away_pens)
          final_result = away_win
        else
          final_result = "Error - no result found."
        end

        puts "#{item["competition"]}: #{item["date"]}"
        puts "#{home_team} vs. #{away_team}"
        puts "Result: #{final_result}"
        
      end
    end

    def self.noPens?(total_pens)
      total_pens == 0
    end

    def self.hasPens?(total_pens)
      total_pens > 0
    end

    def self.homeRegWin?(home_goals, away_goals)
      home_goals > away_goals
    end  

    def self.awayRegWin?(home_goals, away_goals)
      home_goals < away_goals
    end

    def self.draw?(home_goals, away_goals)
      home_goals == away_goals
    end

    def self.homePKwin?(home_pens, away_pens)
      home_pens > away_pens
    end

    def self.awayPKwin?(home_pens, away_pens)
      home_pens < away_pens
    end

  end
 
end
