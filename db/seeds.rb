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

puts "Added users"

# ======= Tournaments ==========
premier = Tournament.create(name: "Premier League", organizer: "FA", number_of_weeks: 38, sport: "Football", competition_style: "Round Robin", season: "2012/2013", country: "England")

champions = Tournament.create(name: "Champions League", organizer: "UEFA", number_of_weeks: 13, sport: "Football", competition_style: "Hybrid", season: "2012/2013", country: "Europe")

puts "Added tournaments"

# ========== Campaigns ============
soccerist = Campaign.create(name: "First Soccerist", published: true, number_of_matchdays: 2, win_points: 3, lose_points: 0, draw_points: 1, contest_type: "Round-robin", tournament_id: premier)

soccerite = Campaign.create(name: "First Soccerite", published: true, number_of_matchdays: 3, win_points: 5, lose_points: 1, draw_points: 2, contest_type: "Knockout", tournament_id: champions)

puts "Added campaigns"

# ============= Teams ===========

# ------- Premier League --------
arsenal     = premier.teams.create(name: "Arsenal", short_name: "ARS", home_field: "Emirates Stadium", shape: "Excellent", sport: "Football", country: "England", logo: "Football/Premier_League/Arsenal.png")
astonvilla  = premier.teams.create(name: "Aston Villa", short_name: "AVFC", home_field: "Villa Park", shape: "Poor", sport: "Football", country: "England", logo: "Football/Premier_League/Aston_Villa.png")
chelsea     = premier.teams.create(name: "Chelsea", short_name: "CHE", home_field: "Stamford Bridge", shape: "Excellent", sport: "Football", country: "England", logo: "Football/Premier_League/Chelsea.png")
everton     = premier.teams.create(name: "Everton", short_name: "EVE", home_field: "Goodison Park", shape: "Excellent", sport: "Football", country: "England", logo: "Football/Premier_League/Everton.png")
fulham      = premier.teams.create(name: "Fulham", short_name: "FUL", home_field: "Craven Cottage", shape: "OK", sport: "Football", country: "England", logo: "Football/Premier_League/Fulham.png")
liverpool   = premier.teams.create(name: "Liverpool", short_name: "LIV", home_field: "Anfield", shape: "Good", sport: "Football", country: "England", logo: "Football/Premier_League/Liverpool.png")
manc        = premier.teams.create(name: "Manchester City", short_name: "MANC", home_field: "Etihad Stadium", shape: "Excellent", sport: "Football", country: "England", logo: "Football/Premier_League/Manchester_City.png")
manu        = premier.teams.create(name: "Manchester United", short_name: "MANU", home_field: "Old Trafford", shape: "Excellent", sport: "Football", country: "England", logo: "Football/Premier_League/Manchester_United.png")
newcastle   = premier.teams.create(name: "Newcastle United", short_name: "NEWC", home_field: "St. James' Park", shape: "Poor", sport: "Football", country: "England", logo: "Football/Premier_League/Newcastle_United.png")
norwich     = premier.teams.create(name: "Norwich City", short_name: "NORW", home_field: "Carrow Road", shape: "OK", sport: "Football", country: "England", logo: "Football/Premier_League/Norwich_City.png")
qpr         = premier.teams.create(name: "Queens Park Rangers", short_name: "QPR", home_field: "Loftus Road", shape: "Poor", sport: "Football", country: "England", logo: "Football/Premier_League/Queens_Park_Rangers.png")
reading     = premier.teams.create(name: "Reading", short_name: "READ", home_field: "Madejski Stadium", shape: "Poor", sport: "Football", country: "England", logo: "Football/Premier_League/Reading.png")
sotton      = premier.teams.create(name: "Southampton", short_name: "SOT", home_field: "St. Mary's Stadium", shape: "OK", sport: "Football", country: "England", logo: "Football/Premier_League/Southampton.png")
stoke       = premier.teams.create(name: "Stoke City", short_name: "STK", home_field: "Britannia Stadium", shape: "OK", sport: "Football", country: "England", logo: "Football/Premier_League/Stoke_City.png")
sunderland  = premier.teams.create(name: "Sunderland", short_name: "SUND", home_field: "Stadium of Light", shape: "Poor", sport: "Football", country: "England", logo: "Football/Premier_League/Sunderland.png")
swansea     = premier.teams.create(name: "Swansea City", short_name: "SWA", home_field: "Liberty Stadium", shape: "Good", sport: "Football", country: "England", logo: "Football/Premier_League/Swansea_City.png")
spurs       = premier.teams.create(name: "Tottenham Hotspur", short_name: "TOT", home_field: "White Hart Lane", shape: "Excellent", sport: "Football", country: "England", logo: "Football/Premier_League/Tottenham_Hotspur.png")
westbrom    = premier.teams.create(name: "West Bromwich Albion", short_name: "WBA", home_field: "The Hawthorns", shape: "Good", sport: "Football", country: "England", logo: "Football/Premier_League/West_Bromwich_Albion.png")
westham     = premier.teams.create(name: "West Ham United", short_name: "WHU", home_field: "Boleyn Ground", shape: "Good", sport: "Football", country: "England", logo: "Football/Premier_League/West_Ham_United.png")
wigan       = premier.teams.create(name: "Wigan Athletic", short_name: "WIG", home_field: "DW Stadium", shape: "Poor", sport: "Football", country: "England", logo: "Football/Premier_League/Wigan_Athletic.png")

puts "Added EPL teams"

# ------ Champions League --------
arsenalcl   = champions.participations.create(team_id: Team.find_by_name("Arsenal"))
chelseacl   = champions.participations.create(team_id: Team.find_by_name("Chelsea"))
manccl      = champions.participations.create(team_id: Team.find_by_name("Manchester City"))
manucl      = champions.participations.create(team_id: Team.find_by_name("Manchester United"))

puts "Added UEFACL teams"

# ======= Weeks =============
premier.number_of_weeks.times do |week|
  premier.weeks.create(week_number: week+1)
end

puts "Added weeks"

# ======== Matches ==============
premier.weeks.find_by_week_number(36).matches.create(home_team: westbrom, away_team: wigan, :match_time => Time.new(2013, 5, 4, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: westbrom.home_field, final_result: "A", home_score: 2, away_score: 3)
premier.weeks.find_by_week_number(36).matches.create(home_team: westham, away_team: newcastle, :match_time => Time.new(2013, 5, 4, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: westham.home_field, final_result: "D", home_score: 0, away_score: 0)
premier.weeks.find_by_week_number(36).matches.create(home_team: swansea, away_team: manc, :match_time => Time.new(2013, 5, 4, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: swansea.home_field, final_result: "D", home_score: 0, away_score: 0)
premier.weeks.find_by_week_number(36).matches.create(home_team: fulham, away_team: reading, :match_time => Time.new(2013, 5, 4, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: fulham.home_field, final_result: "A", home_score: 2, away_score: 4)
premier.weeks.find_by_week_number(36).matches.create(home_team: norwich, away_team: astonvilla, :match_time => Time.new(2013, 5, 4, 15, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: norwich.home_field, final_result: "A", home_score: 1, away_score: 2)
premier.weeks.find_by_week_number(36).matches.create(home_team: spurs, away_team: sotton, :match_time => Time.new(2013, 5, 4, 15, 30, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: spurs.home_field, final_result: "H", home_score: 1, away_score: 0)
premier.weeks.find_by_week_number(36).matches.create(home_team: qpr, away_team: arsenal, :match_time => Time.new(2013, 5, 4, 17, 30, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: qpr.home_field, final_result: "A", home_score: 0, away_score: 1)
premier.weeks.find_by_week_number(36).matches.create(home_team: liverpool, away_team: everton, :match_time => Time.new(2013, 5, 5, 13, 30, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: liverpool.home_field, final_result: "D", home_score: 0, away_score: 0)
premier.weeks.find_by_week_number(36).matches.create(home_team: manu, away_team: chelsea, :match_time => Time.new(2013, 5, 5, 16, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: manu.home_field, final_result: "A", home_score: 0, away_score: 1)
premier.weeks.find_by_week_number(36).matches.create(home_team: sunderland, away_team: stoke, :match_time => Time.new(2013, 5, 6, 20, 0, 0, "+00:00"), leg: 0, home_odds: 0.0, draw_odds: 0.0, away_odds: 0.0, venue: sunderland.home_field, final_result: "D", home_score: 1, away_score: 1)

puts "Added Week 36"

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

puts "Added Week 37"

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

puts "Added Week 38"





