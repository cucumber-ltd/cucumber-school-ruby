require 'shouty'

describe Person do
  let(:network) { double.as_null_object }

  it "subscribes to the network" do
    expect(network).to receive(:subscribe)
    sean = Person.new(network)
  end

  it "broadcasts shouts to the network" do
    message = "Free bagels!"
    sean = Person.new(network)
    expect(network).to receive(:broadcast).with message
    sean.shout message
  end

end
