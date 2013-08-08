namespace :results do

  require "#{Rails.root}/lib/modules/results_data.rb"

  desc "Prints the results of completed soccer fixtures"
  task :find => :environment do
    puts ResultsData::Results.get_matches
     # puts ResultsData::Results.get_results
  end

end