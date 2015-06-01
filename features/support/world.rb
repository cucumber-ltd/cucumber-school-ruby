module DomainWorld
  def people
    @people ||= {}
  end

  def messages_shouted_by
    @messages_shouted_by ||= {}
  end

  def sean_shout(message)
    people['Sean'].shout(message)
    messages_shouted_by['Sean'] ||= []
    messages_shouted_by['Sean'] << message
  end
end

module WebWorld

  def people
    @people ||= {}
  end

  def messages_shouted_by
    @messages_shouted_by ||= {}
  end

  def sean_shout(message)
    log_in_as 'Sean'
    shout message
    messages_shouted_by['Sean'] ||= []
    messages_shouted_by['Sean'] << message
  end

  private

  def log_in_as(name)
    visit "/?name=#{name}"
  end

  def shout(message)
    warn "TODO: implement shout"
  end
end

if ENV['shouty_test_depth'] == "web"
  require 'capybara/cucumber'
  Capybara.default_driver = :selenium
  Before do
    Capybara.app = WebApp.new(nil, people)
  end
  World(WebWorld)
else
  World(DomainWorld)
end
