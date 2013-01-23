require_relative "../../../lib/twatter/authenticator"
require "vcr_helper"
require "twitter"

class Twatter
  describe Authenticator do
    it "reports valid credentials" do
      VCR.use_cassette "authorize-with-valid-credentials" do
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
