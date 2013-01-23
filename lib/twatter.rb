require "twatter/authenticator"
require "twatter/timeline"
require "twatter/api"

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
    puts "HOME TIMELINE"
    timeline = Timeline.new(API.home_timline)
  end
end
