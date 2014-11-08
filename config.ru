require 'sprockets'
require 'sprockets-sass'
require 'sprockets-helpers'
require_relative './initializer'

# Setup Sprockets for Asset Packaging
map '/assets' do
  environment = Sprockets::Environment.new
  environment.cache = Sprockets::Cache::FileStore.new( File.join(ROOT_DIR,'tmp','assets') )
  environment.append_path 'assets'

  Sprockets::Helpers.configure do |config|
    config.environment = environment
    config.prefix = '/assets'
    config.digest = false # digest should probably be true... check on this
  end

  run environment
end

# Setup Root Router
map('/'){ run OpenCost::RootRouter }
