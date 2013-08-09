namespace :fixtures do

  require "#{Rails.root}/lib/modules/fixtures_data.rb"

  desc "Gets upcoming soccer fixtures"
  task :find => :environment do
    puts FixturesData::Fixtures.get_fixtures
  end

  task :all => [:find]

end

