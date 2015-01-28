module ShoutyWorld

  def people
    @people ||= {}
  end

  def sean_shout(message)
    people['Sean'].shout(message)
    @messages_shouted_by['Sean'] ||= []
    @messages_shouted_by['Sean'] << message
  end

end

World(ShoutyWorld)
