class Twatter
  # Simple value object to hold a tweet's data
  class Tweet < Struct.new(:screen_name, :text)
  end
end
