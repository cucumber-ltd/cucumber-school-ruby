require 'shouty'

Given(/^Lucy is (\d+)m from Sean$/) do |distance|
  lucy = Person.new
  @sean = Person.new
  lucy.move_to(distance)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
end

Then(/^Lucy hears Sean's message$/) do
  pending # express the regexp above with the code you wish you had
end
