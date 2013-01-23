require "yaml"

class Twatter
  module Authenticator
    def self.valid_credentials?
      return false unless Twitter.credentials?
      begin
        Twitter.verify_credentials
        true
      rescue Twitter::Error::Unauthorized, Twitter::Error::BadRequest
        false
      end
    end

    def self.load_credentials(credentials)
      credentials.each do |credential, value|
        Twitter.send("#{credential}=", value)
      end
    end
  end
end
