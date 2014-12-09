class Person
  attr_reader :messages_heard, :location

  def initialize(network, location)
    network.subscribe(self)
    @network, @location = network, location
    @messages_heard = []
  end

  def shout(message)
    @network.broadcast(message, @location)
  end

  def hear(message)
    messages_heard << message
  end

end

class Network
  def initialize(range)
    @range = range
  end

  def subscribe(listener)
    @listeners ||= []
    @listeners << listener
  end

  def broadcast(message, shouter_location)
    @listeners.each do |listener|
      if (listener.location - shouter_location).abs <= @range
        listener.hear message
      end
    end
  end

end
