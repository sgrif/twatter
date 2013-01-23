class Twatter
  module API
    def self.home_timeline
      make_tweets Twitter.home_timeline
    end

    def self.timeline_for(screen_name)
      make_tweets Twitter.user_timeline(screen_name)
    end

    def self.tweet(tid)
      make_tweets([Twitter.status(tid)]).first
    end

    private

      def self.make_tweets(tweets)
        tweets.map do |tweet|
          Tweet.new(tweet.user.screen_name, tweet.text)
        end
      end
  end
end
