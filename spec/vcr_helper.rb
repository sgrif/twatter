require "vcr"

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
end
