require "twatter/authenticator"
require "twatter/timeline"
require "twatter/api"
require "twatter/tweet"

class Twatter
  extend Forwardable
  def_delegator :@output, :puts
  def_delegator :@input, :gets

  def initialize(output, input)
    @output, @input = output, input
  end

  def run
    if Authenticator.valid_credentials?
      render_home_timeline
    else
      puts "Enter PIN >"
    end
  end

  def render_home_timeline
    puts "HOME TIMELINE".rjust(17)
    timeline = Timeline.new(API.home_timeline)
    timeline.tweets.each do |tweet|
      puts "@#{tweet.screen_name}".rjust(17) + " " + tweet.text
    end
  end
end
