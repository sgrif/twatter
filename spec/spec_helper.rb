lib_path = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include? lib_path

require "twitter"
require "vcr_helper"
require "twatter"
require "aruba/api"

RSpec.configure do |c|
  c.include Aruba::Api
end
