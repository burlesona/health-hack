require 'sinatra/base'
require 'slim'

module OpenCost
  class RootRouter < Sinatra::Base
    # Configuration
    set :views, 'views'
    enable :sessions

    post '/search' do
      redirect to("/results?e=#{params[:employer].parameterize}&p=#{params[:procedure]}")
    end

    get '/results' do
      @employer = params[:e].titleize
      @procedure = params[:p]
      slim :results
    end

    get '/' do
      slim :hello
    end
  end
end
