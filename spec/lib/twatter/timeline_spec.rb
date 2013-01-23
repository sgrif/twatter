require_relative "../../../lib/twatter/timeline"

class Twatter
  describe Timeline do
    let(:tweet) { double(:tweet) }
    let(:timeline) { Timeline.new(tweet) }

    it "holds tweets" do
      timeline.tweets.should == [tweet]
    end

    it "returns a new timeline with more tweets" do
      tweet2 = double(:tweet)
      tweet3 = double(:tweet)
      new_timeline = timeline.add_tweets(tweet2, tweet3)

      timeline.tweets.should == [tweet]
      new_timeline.tweets.should == [tweet, tweet2, tweet3]
    end
  end
end
