World(Aruba::Api)

Given /^I am authenticated$/ do
  credentials = {
    consumer_key: ENV.fetch("TWATTER_CONSUMER_KEY"),
    consumer_secret: ENV.fetch("TWATTER_CONSUMER_SECRET"),
    oauth_token: ENV.fetch("TWATTER_OAUTH_TOKEN"),
    oauth_token_secret: ENV.fetch("TWATTER_OAUTH_TOKEN_SECRET")
  }
  f = write_file(".twitter_credentials", credentials.to_yaml)
  in_current_dir { @config_file = File.realpath(f) }
end

Given /^I am not authenticated$/ do
  Twitter.configure do |c|
    c.consumer_key = ""
    c.consumer_secret = nil
    c.oauth_token = nil
    c.oauth_token_secret = nil
  end
end

When /^I start the app$/ do
  cmd = "twatter"
  cmd += " -c #{@config_file}" if @config_file
  run_simple(cmd)
end

Then /^I should see my home timeline$/ do
  assert_partial_output("    HOME TIMELINE", all_output)
  assert_partial_output("    @ChainfireXDA Darn EGIT always borking on not being able to delete files when switching branches ... anyone familiar with that issue and the solution ?", all_output)
end
