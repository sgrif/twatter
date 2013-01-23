class Twatter
  class Timeline
    attr_reader :tweets

    def initialize(*tweets)
      @tweets = tweets.flatten
    end

    def add_tweets(*args)
      new_tweets = tweets.dup
      args.each { |tweet| new_tweets << tweet }
      Timeline.new new_tweets
    end
  end
end
