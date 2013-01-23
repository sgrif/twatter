require "yaml"

class Twatter
  class Authenticator
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
      Twitter.configure do |c|
        credentials.each do |k, v|
          c.send("#{k}=", v)
        end
      end
    end
  end
end
