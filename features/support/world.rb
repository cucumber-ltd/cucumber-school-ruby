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
    warn "TODO: implement log_in_as"
  end

  def shout(message)
    warn "TODO: implement shout"
  end
end

if ENV['shouty_test_depth'] == "web"
  World(WebWorld)
else
  World(DomainWorld)
end
