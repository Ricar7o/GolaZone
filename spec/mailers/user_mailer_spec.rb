require "spec_helper"

describe UserMailer do
  describe "campaign_invitation" do
    let(:mail) { UserMailer.campaign_invitation }

    it "renders the headers" do
      mail.subject.should eq("Campaign invitation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
