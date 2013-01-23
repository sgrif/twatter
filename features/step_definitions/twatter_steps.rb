class IODouble
  def messages
    @messages ||= []
  end

  def puts(*args)
    args.each { |m| messages << m }
  end
end

def io
  @io ||= IODouble.new
end

Given /^I am authenticated$/ do
end

When /^I start the app$/ do
  app = Twatter.new(io, io)
  app.run
end

Then /^I should see my home timeline$/ do
  io.messages.should include("HOME TIMELINE")
  io.messages.should include(" " * 7 + '@ZachsMind "Feeling love is beautiful. Feeling the earth is 6,000 years old is stupid." @PennJillette #quote http://nyti.ms/TirhOn  #atheism')
end
