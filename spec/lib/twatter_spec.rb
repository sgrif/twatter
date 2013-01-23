require_relative "../../lib/twatter"

describe Twatter do
  let(:io) { double(:io) }
  let(:app) { Twatter.new(io, io) }

  context "user is authenticated" do
    before { Twatter::Authenticator.stub(:valid_credentials?).and_return(true) }

    it "shows the user's home timeline" do
      Twatter::API.stub(:home_timeline).and_return([])
      io.should_receive(:puts).with("    HOME TIMELINE")
      app.run
    end
  end

  context "user is not authenticated" do
    before { Twatter::Authenticator.stub(:valid_credentials?).and_return(false) }

    it "prompts the user for authentication" do
      io.should_receive(:puts).with("Enter PIN >")
      app.run
    end
  end
end
