require_relative "../../../lib/twatter/tweet"

class Twatter
  describe Tweet do
    it "is equal to tweets with the same content" do
      Tweet.new("foo", "bar").should == Tweet.new("foo", "bar")
    end
  end
end
