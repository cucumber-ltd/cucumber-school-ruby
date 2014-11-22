class Person
  def initialize(network)
    network.subscribe(self)
    @network = network
  end

  def move_to(location)
  end

  def shout(message)
    @network.broadcast(message)
  end

  def messages_heard
    ["Free bagels!"]
  end
end

class Network
  def subscribe(listener)
  end

  def broadcast(message)
  end
end
