require 'sinatra/base'
require 'slim'

module OpenCost
  class RootRouter < Sinatra::Base
    # Configuration
    set :views, 'views'

    get '/' do
      slim :hello
    end
  end
end
