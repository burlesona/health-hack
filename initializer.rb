require 'dotenv'
require 'better_errors'
require 'binding_of_caller'
require 'rethinkdb'
require 'active_support/all'

# Configure Environment
ROOT_DIR = Dir.pwd
Dotenv.load

# Require Application Files
Dir['./{lib,routers}/**/*.rb'].each do |file|
  require file
end
