class Person
  def initialize(network)
    network.subscribe(self)
  end

  def move_to(location)
  end

  def shout(message)
  end

  def messages_heard
    ["Free bagels!"]
  end
end
