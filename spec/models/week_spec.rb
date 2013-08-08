require 'spec_helper'

describe Week do
  describe '#update_latest_match(match)' do
    context "when a new match is scheduled before the latest match of the week" do
    end

    context "when a new match is scheduled after the latest match of the week" do
    end
  end

  describe '#update_earliest_match(match)' do
    context "when a new match is scheduled before the earliest match of the week" do
    end

    context "when a new match is scheduled after the earliest match of the week" do
    end
  end

  describe '#update_reschedules(match)' do
    let(:week) { Week.new }
    let(:match) { mock_model(Match, week: week) }

    context "when the week has no rescheduled matches and the new match is not rescheduled" do
      it "should not modify the week's rescheduled_matches attribute" do
        expect(week.rescheduled_matches).to be_false
      end
    end

    context "when the week has no rescheduled matches and the new match is rescheduled" do
      it "should updated the rescheduled_matches attribute for this week to true" do
        match.stub(rescheduled: true)
        week.update_reschedules(match)

        expect(week.rescheduled_matches).to be_true
      end
    end

    # let(:week) { mock_model(Week), rescheduled_matches: true }
    context "when the week already has a rescheduled match and the new match is not rescheduled" do
      it "the week's rescheduled_matches attribute should be true" do
        match.stub(rescheduled: false)
        week.rescheduled_matches = true
        week.update_reschedules(match)

        expect(week.rescheduled_matches).to be_true
      end
    end

    context "when the week already has a rescheduled match and the new match is rescheduled" do
      it "the week's rescheduled_matches attribute should be true" do
        match.stub(rescheduled: true)
        week.rescheduled_matches = true
        week.update_reschedules(match)

        expect(week.rescheduled_matches).to be_true
      end
    end

  end

end
