module ResultsData

  require 'httparty'
  require 'json'

  # This gets the results of a tournament's games for a specified period of time.  

  class Results

    # This gets the matches of the day, turns them into a JSON object, loops over the object and assigns specific match data to variables.  It then gets the results of those matches by making a request of the get_results method using the variables above.  

    def self.get_matches
      # todays_matches = Match.where("DATE(match_time) = ?", Date.today)
      todays_matches = Match.where("DATE(match_time) = ?", '2013-05-12')
      matches_object = todays_matches.to_json

      JSON.parse(matches_object).each do |mo|
        @homeTeam = Team.where(id: "#{mo["home_team_id"]}").first.name
        @matchTime = Time.parse("#{mo["match_time"]}")
        @matchTournament = Match.find("#{mo["id"]}").week.tournament.name
        @matchSeason = Match.find("#{mo["id"]}").week.tournament.season  

        # Results.get_results(@homeTeam, @matchTime, @matchTournament, @matchSeason)
        
        # This requests the results data, but uses Delayed Worker to delay the action to run at a later time.  In this cae, the delayed time is 10800 seconds (three hours) in the future.
        Results.delay(run_at: @matchTime.since(10800)).get_results(@homeTeam, @matchTime, @matchTournament, @matchSeason)

      end
    end

    # This gets the winner of each game of a tournament by evaluation whether it did or did not go to penalty kicks and then deciding the winner based the number of fulltime goals or penalty kick goals. In all cases, [0] is the home team, while [1] is the away team.  The total_pens exists because the JSON always returns the score of the penalty kicks, even if there weren't any.  So we have to ask if there are any and then we decide if it should decide the score of the game.

    def self.get_results(team, time, tournament, season)
      # This is the call to the API

      competition = tournament.downcase.strip.gsub(' ', '-')
      api_key = "free"
      year_name = season
      from_date = time.strftime("%Y-%m-%d")
      to_date = (time + (24*60*60)).strftime("%Y-%m-%d")
      timezone = "Europe/London"
      team_name = team.downcase.strip.gsub(' ', '-')

      league_response= HTTParty.get("http://api.statsfc.com/#{competition}/results.json?key=#{api_key}&year=#{year_name}&team=#{team_name}&from=#{from_date}&to=#{to_date}&timezone=#{timezone}")

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
        
        home_team_data = Team.where(name: home_team).first.id
        away_team_data = Team.where(name: away_team).first.id
        match_time_data = (item["date"]).to_time
        match_to_database = Match.where(home_team_id: home_team_data, away_team_id: away_team_data, match_time: match_time_data).first
        match_to_database[:home_score] = home_goals
        match_to_database[:away_score] = away_goals
        match_to_database[:final_result] = final_result
        match_to_database.save  
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
