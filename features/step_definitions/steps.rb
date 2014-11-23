require 'shouty'

Before do
  @network = Network.new
  @people = {}
end

Given(/^a person named (\w+)$/) do |name|
  @people[name] = Person.new(@network)
end

Given(/^a person named Sean$/) do
  @sean = Person.new(@network)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
  @message_from_sean = message
end

Then(/^Lucy hears Sean's message$/) do
  expect(@people['Lucy'].messages_heard).to include @message_from_sean
end
