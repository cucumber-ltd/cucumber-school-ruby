require 'sinatra/base'
class WebApp < Sinatra::Application
  configure :test do
    enable :raise_errors
    disable :show_exceptions, :logging
  end

  def initialize(app = nil, people = {})
    super(app)
    @people = people
  end

  get "/" do
    error(401) unless @people.key?(params['name'])
  end

  error 401 do
    "Unauthorized."
  end
end
