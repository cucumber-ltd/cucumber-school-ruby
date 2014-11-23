require 'shouty'

Given(/^Lucy is (\d+)m from Sean$/) do |distance|
  @lucy = Person.new
  @sean = Person.new
  @lucy.move_to(distance)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
  @message_from_sean = message
end

Then(/^Lucy hears Sean's message$/) do
  expect(@lucy.messages_heard).to include @message_from_sean
end
