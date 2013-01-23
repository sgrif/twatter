class Twatter
  class Authenticator
    def self.valid_credentials?
      begin
        Twitter.home_timeline count: 1
        true
      rescue Twitter::Error::Unauthorized, Twitter::Error::BadRequest
        false
      end
    end
  end
end
