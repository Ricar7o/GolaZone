namespace :results do

  require "#{Rails.root}/lib/modules/results_data.rb"

  desc "Gets the results of completed soccer fixtures"
  task :find => :environment do
    ResultsData::Results.get_matches
    # puts ResultsData::Results.get_results
  end

end