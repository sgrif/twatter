require "spec_helper"

class Twatter
  describe Authenticator do
    let(:credentials) do
      {
        consumer_key: ENV.fetch("TWATTER_CONSUMER_KEY"),
        consumer_secret: ENV.fetch("TWATTER_CONSUMER_SECRET"),
        oauth_token: ENV.fetch("TWATTER_OAUTH_TOKEN"),
        oauth_token_secret: ENV.fetch("TWATTER_OAUTH_TOKEN_SECRET")
      }
    end

    it "reports valid credentials" do
      VCR.use_cassette "authorize-with-valid-credentials" do
        Authenticator.load_credentials credentials
        Authenticator.valid_credentials?.should be_true
      end
    end

    it "reports if credentials are invalid" do
      VCR.use_cassette "authorize-with-invalid-credentials" do
        Twitter.configure { |c| c.oauth_token = "invalid" }
        Authenticator.valid_credentials?.should be_false
      end
    end

    it "reports invalid credentials for nil" do
      VCR.use_cassette "authorize-with-nil-credentials" do
        Twitter.configure { |c| c.oauth_token = nil }
        Authenticator.valid_credentials?.should be_false
      end
    end
  end
end
