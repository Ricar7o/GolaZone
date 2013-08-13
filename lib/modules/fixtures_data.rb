module FixturesData
  
  require 'httparty'

  # Lists all of the completed fixtures for a competition in the time-window selected.  

  class Fixtures

    # This makes a request to the StatsFC API.  HTTParty turns it into a hash which is assigned to the variable fixture_response.  It then iterates through fixture_response and prints the competition, its timing, and the teams.

    def self.get_team

      Team.all.each do |t|
        team_to_run = t.name
        team_for_fixtures = team_to_run.downcase.strip.gsub(' ', '-')
        Fixtures.get_fixtures(team_for_fixtures)
      end
    
    end

    def self.get_fixtures(team)

    #   # These are the variable options for the API request.  

      competition = "premier-league"
      api_key = "free"
      year_name = "2012/2013"
      team_name = team
      from_date = "2012-08-18"
      to_date = "2013-05-19"
      timezone = "Europe/London"
      limit = 38
      counter = 38

      fixture_response = HTTParty.get("http://api.statsfc.com/#{competition}/results.json?key=#{api_key}&year=#{year_name}&team=#{team_name}&from=#{from_date}&to=#{to_date}&timezone=#{timezone}&limit=#{limit}")

      fixture_response.each do |item|

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

        if counter == 38 || counter == 37 || counter == 36
          counter -= 1
        else
          m = Match.create()
          m.week_id = counter
          m.home_team_id = Team.where(name: home_team).first.id
          m.away_team_id = Team.where(name: away_team).first.id
          m.match_time = (item["date"]).to_time
          m.rescheduled = false
          m.home_score = home_goals
          m.away_score = away_goals
          m.leg = 0
          m.home_odds = 0.0
          m.away_odds = 0.0
          m.draw_odds = 0.0
          m.venue = Team.where(name: home_team).first.home_field
          m.final_result = final_result
          m.save
          sleep(1)
          counter -= 1
        end 
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



# Chelsea 18 home games - Postponed from week 33
# Manchester City 18 home games - Forgot to add
# Southampton 20 away games - API got the time wrong
# Swansea 18 away games - Postponed from week 33
# Tottenham 20 home games - API got the time wrong
# Tottenham 18 away games - Postponed from week 33
# West Brom 18 away games - Postponed from week 33
# Wigan 18 home games - Postponed from week 33
