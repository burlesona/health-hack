require 'sinatra/base'
require 'slim'

module OpenCost
  class RootRouter < Sinatra::Base
    # Configuration
    set :views, 'views'

    helpers do
      def money(string)
        Money.new((string + "00").to_i).format(:no_cents => true)
      end
    end

    post '/search' do
      redirect to("/results?e=#{params[:employer].parameterize}&p=#{params[:procedure]}")
    end

    get '/results' do
      @employer = params[:e].titleize
      @procedure = params[:p]
      @results = dataset.where(employer_slug: params[:e])
      slim :results
    end

    get '/' do
      slim :hello
    end


    def dataset
      @dataset ||= Dataset.new(File.join(ROOT_DIR,"data","data2.csv"))
    end
  end
end
