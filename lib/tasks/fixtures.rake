namespace :fixtures do

  require "#{Rails.root}/lib/modules/fixtures_data.rb"

  desc "Gets upcoming soccer fixtures"
  task :find => :environment do
    FixturesData::Fixtures.get_team
  end

  task :all => [:find]

end

