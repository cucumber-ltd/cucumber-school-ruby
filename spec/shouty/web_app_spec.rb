ENV['RACK_ENV'] = 'test'
require 'shouty/web_app'
require 'rack/test'

describe WebApp do
  include Rack::Test::Methods

  let(:app) { WebApp.new(nil, people) }
  let(:people) { { 'Sean' => double } }

  it "returns a homepage when a registered user's name is specified in the URL" do
    get '/?name=Sean'
    expect(last_response).to be_ok
  end

  it "returns 401 when the user is not recognised" do
    get '/?name=Unknown'
    expect(last_response.status).to eq 401
    expect(last_response.body).to match /unauthorized/i
  end
end
