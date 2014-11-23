require 'shouty'

Before do
  @network = Network.new
end

Given(/^a person named Lucy$/) do
  @lucy = Person.new(@network)
end

Given(/^a person named Sean$/) do
  @sean = Person.new(@network)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
  @message_from_sean = message
end

Then(/^Lucy hears Sean's message$/) do
  expect(@lucy.messages_heard).to include @message_from_sean
end
