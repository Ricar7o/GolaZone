require 'spec_helper'
require "#{Rails.root}/lib/modules/fixtures_data.rb"

describe FixturesData::Fixtures do 
  describe '.get_fixtures' do

    let(:fixtures) {FixturesData::Fixtures.get_fixtures}

    context "when the call to the API is successful" do
      # let(:fixture_response) {{"competition" => "Premier League", "date" => "2013-08-17 12:45:00", "home" => "Liverpool", "away" => "Stoke City"}}
      # it 'the fixture_response object should return an array populated with data'
      #   expect(:fixture_response).to eq({"competition"=> "Premier League", "date"=> "2013-08-17 12:45:00", "home"=> "Liverpool", "away" => "Stoke City",})
      # end  

      it 'should return competition time and teams' do
        expect { fixtures }.to eq("Premier League: 2013-08-17 12:45:00\nLiverpool vs. Stoke City")
      end
    end

    # context "when the call to the API fails" do
    #   let(:fixture_response) {{"error"=>"No fixtures found"}}
    #   it 'the fixture_response object should return a hash with the key "error" ' do 
    #     expect(:fixture_response).to eq({"error"=>"No fixtures found"})
    #   end
    # end
  end
end