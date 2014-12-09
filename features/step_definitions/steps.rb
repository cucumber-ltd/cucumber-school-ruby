require 'shouty'

Before do
  @people = {}
end

Given(/^the range is (\d+)$/) do |range|
  @network = Network.new(range.to_i)
end

Given(/^the following people:$/) do |table|
  table = table.map_column('location') { |raw_location| raw_location.to_i }
  table.hashes.each do |row|
    name = row['name']
    location = row['location']
    @people[name] = Person.new(@network, location)
  end
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @people['Sean'].shout(message)
  @message_from_sean = message
end

Then(/^Lucy hears Sean's message$/) do
  expect(@people['Lucy'].messages_heard).to include @message_from_sean
end

Then(/^Larry does not hear Sean's message$/) do
  expect(@people['Larry'].messages_heard).to_not include @message_from_sean
end
