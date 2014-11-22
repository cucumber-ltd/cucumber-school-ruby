require 'shouty'

describe Person do
  let(:network) { double.as_null_object }

  it "subscribes to the network" do
    expect(network).to receive(:subscribe)
    sean = Person.new(network)
  end

end
