require 'shouty'

Before do
  @people = {}
end

Given(/^the range is (\d+)$/) do |range|
  @network = Network.new(range.to_i)
end

Given(/^a person named (\w+) at location (\d+)$/) do |name, location|
  @people[name] = Person.new(@network, location.to_i)
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
