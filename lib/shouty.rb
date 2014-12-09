class Person
  attr_reader :messages_heard

  def initialize(network, location)
    network.subscribe(self)
    @network = network
    @messages_heard = []
  end

  def shout(message)
    @network.broadcast(message)
  end

  def hear(message)
    messages_heard << message
  end

end

class Network
  def initialize(range)

  end

  def subscribe(listener)
    @listeners ||= []
    @listeners << listener
  end

  def broadcast(message)
    @listeners.each do |listener|
      listener.hear message
    end
  end
end
