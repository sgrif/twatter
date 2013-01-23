require_relative "../../../lib/twatter/api"
require_relative "../../../lib/twatter/tweet"
require "twitter"
require "vcr_helper"

class Twatter
  describe API do
    it "fetches my home timeline" do
      VCR.use_cassette("home-timeline") do
        tweet = Tweet.new("robertherjavec", %{doing fnal edit of 2nd book- quote from my dad " working hard doesn't mean you'll be rich but not working hard guarantees you'll stay poor"})
        home_timeline = API.home_timeline

        home_timeline.should include(tweet)
        home_timeline.size.should be > 1
      end
    end

    it "fetches a users timeline" do
      VCR.use_cassette("user-timeline") do
        tweet = Tweet.new("sgrif", "Alright, Clojure... I'll give you a shot.")
        API.timeline_for("sgrif").first.should == tweet
      end
    end

    it "fetches a single tweet" do
      VCR.use_cassette("single-tweet") do
        tweet = Tweet.new("garybernhardt", "Today's Twitter slowness points out what a great job they've done at transforming a once-flaky system into a (mostly) very stable one.")
        API.tweet(293622889096282112).should == tweet
      end
    end
  end
end
