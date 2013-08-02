# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# =========== Users ============
r = User.create(email: "ricardo07@gmail.com", first_name: "Ricardo", last_name: "Cervantes", username: "Ricar7o", language: "es-MX")
r.update_attribute(:encrypted_password, "$2a$10$KYAleurGyaNoVR.W/lBfWumrwAkMGHlf8MOpTtPazuHk8uxBJ/yUy")

m = User.create(email: "matt.tschoegl@gmail.com", first_name: "Matt", last_name: "Tschoegl", username: "mst2002", language: "en")
m.update_attribute(:encrypted_password, "$2a$10$KYAleurGyaNoVR.W/lBfWumrwAkMGHlf8MOpTtPazuHk8uxBJ/yUy")

# ======= Tournaments ==========
premier = Tournament.create(name: "Premier League", organizer: "FA", number_of_weeks: 38, sport: "Football", competition_style: "Round Robin", season: "2012-2013", country: "England")

champions = Tournament.create(name: "Champions League", organizer: "UEFA", number_of_weeks: 13, sport: "Football", competition_style: "Hybrid", season: "2012-2013", country: "Europe")

# ========== Campaigns ============
soccerist = Campaign.create(name: "First Soccerist", published: true, number_of_matchdays: 2, win_points: 3, lose_points: 0, draw_points: 1, contest_type: "Round-robin", tournament_id: premier)

soccerite = Campaign.create(name: "First Soccerite", published: true, number_of_matchdays: 3, win_points: 5, lose_points: 1, draw_points: 2, contest_type: "Knockout", tournament_id: champions)

# ============= Teams ===========

# ------- Premier League --------
arsenal     = premier.teams.create(name: "Arsenal", home_field: "Emirates Stadium", shape: "Excellent", sport: "Football")
astonvilla  = premier.teams.create(name: "Aston Villa", home_field: "Villa Park", shape: "Poor", sport: "Football")
chelsea     = premier.teams.create(name: "Chelsea", home_field: "Stamford Bridge", shape: "Excellent", sport: "Football")
everton     = premier.teams.create(name: "Everton", home_field: "Goodison Park", shape: "Excellent", sport: "Football")
fulham      = premier.teams.create(name: "Fulham", home_field: "Craven Cottage", shape: "OK", sport: "Football")
liverpool   = premier.teams.create(name: "Liverpool", home_field: "Anfield", shape: "Good", sport: "Football")
manc        = premier.teams.create(name: "Manchester City", home_field: "Etihad Stadium", shape: "Excellent", sport: "Football")
manu        = premier.teams.create(name: "Manchester United", home_field: "Old Trafford", shape: "Excellent", sport: "Football")
newcastle   = premier.teams.create(name: "Newcastle United", home_field: "St. James' Park", shape: "Poor", sport: "Football")
norwich     = premier.teams.create(name: "Norwich City", home_field: "Carrow Road", shape: "OK", sport: "Football")
qpr         = premier.teams.create(name: "Queens Park Rangers", home_field: "Loftus Road", shape: "Poor", sport: "Football")
reading     = premier.teams.create(name: "Reading", home_field: "Madejski Stadium", shape: "Poor", sport: "Football")
sotton      = premier.teams.create(name: "Southampton", home_field: "St. Mary's Stadium", shape: "OK", sport: "Football")
stoke       = premier.teams.create(name: "Stoke City", home_field: "Britannia Stadium", shape: "OK", sport: "Football")
sunderland  = premier.teams.create(name: "Sunderland", home_field: "Stadium of Light", shape: "Poor", sport: "Football")
swansea     = premier.teams.create(name: "Swansea City", home_field: "Liberty Stadium", shape: "Good", sport: "Football")
spurs       = premier.teams.create(name: "Tottenham Hotspur", home_field: "White Hart Lane", shape: "Excellent", sport: "Football")
westbrom    = premier.teams.create(name: "West Bromwich Albion", home_field: "The Hawthorns", shape: "Good", sport: "Football")
westham     = premier.teams.create(name: "West Ham United", home_field: "Boleyn Ground", shape: "Good", sport: "Football")
wigan       = premier.teams.create(name: "Wigan Athletic", home_field: "DW Stadium", shape: "Poor", sport: "Football")

# ------ Champions League --------
arsenalcl   = champions.participations.create(team_id: Team.find_by_name("Arsenal"))
chelseacl   = champions.participations.create(team_id: Team.find_by_name("Chelsea"))
manccl      = champions.participations.create(team_id: Team.find_by_name("Manchester City"))
manucl      = champions.participations.create(team_id: Team.find_by_name("Manchester United"))

# ======= Weeks =============
premier.number_of_weeks.times do |week|
  premier.weeks.create(week_number: week+1)
end

# ======== Matches ==============
premier.weeks.find_by_week_number(37).matches.create(home_team: astonvilla, away_team: chelsea, :match_time => Time.new(2013, 5, 11, 12, 45, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: astonvilla.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: stoke, away_team: spurs, match_time: Time.new(2013,5,12, 13, 30, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: stoke.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: sunderland, away_team: sotton, match_time: Time.new(2013,5,12, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: sunderland.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: qpr, away_team: newcastle, match_time: Time.new(2013,5,12, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: qpr.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: norwich, away_team: westbrom, match_time: Time.new(2013,5,12, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: norwich.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: fulham, away_team: liverpool, match_time: Time.new(2013,5,12, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: fulham.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: everton, away_team: westham, match_time: Time.new(2013,5,12, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: everton.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: manu, away_team: swansea, match_time: Time.new(2013,5,12, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: manu.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: arsenal, away_team: wigan, match_time: Time.new(2013,5,14, 19, 45, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: arsenal.home_field)
premier.weeks.find_by_week_number(37).matches.create(home_team: reading, away_team: manc, match_time: Time.new(2013,5,14, 20, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: reading.home_field)

premier.weeks.find_by_week_number(38).matches.create(home_team: wigan, away_team: astonvilla, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: wigan.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: westham, away_team: reading, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: westham.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: westbrom, away_team: manu, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: westbrom.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: spurs, away_team: sunderland, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: spurs.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: swansea, away_team: fulham, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: swansea.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: sotton, away_team: stoke, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: sotton.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: newcastle, away_team: arsenal, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: newcastle.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: manc, away_team: norwich, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: manc.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: liverpool, away_team: qpr, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: liverpool.home_field)
premier.weeks.find_by_week_number(38).matches.create(home_team: chelsea, away_team: everton, match_time: Time.new(2013,5,19, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: chelsea.home_field)







