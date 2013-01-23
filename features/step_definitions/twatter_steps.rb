World(Aruba::Api)

Given /^I am authenticated$/ do
  credentials = {
    consumer_key: ENV.fetch("TWATTER_CONSUMER_KEY"),
    consumer_secret: ENV.fetch("TWATTER_CONSUMER_SECRET"),
    oauth_token: ENV.fetch("TWATTER_OAUTH_TOKEN"),
    oauth_token_secret: ENV.fetch("TWATTER_OAUTH_TOKEN_SECRET")
  }
  f = write_file(".twitter_credentials", credentials.to_yaml)
  in_current_dir { @credentials = File.realpath(f) }
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
  run_simple("twatter -c #{@credentials}")
end

Then /^I should see my home timeline$/ do
  assert_partial_output("    HOME TIMELINE", all_output)
  assert_matching_output('\s+ @\w+ .*', all_output)
end
