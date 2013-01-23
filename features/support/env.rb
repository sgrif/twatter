lib_dir = File.expand_path("../../../lib", __FILE__)
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include? lib_dir

require "twatter"
require "twitter"
require "aruba/cucumber"
require "aruba/api"
require "yaml"
require "cucumber/rspec/doubles"
