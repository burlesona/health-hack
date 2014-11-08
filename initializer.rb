require 'dotenv'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash'
require 'money'

# Configure Environment
ROOT_DIR = Dir.pwd
Dotenv.load

# Require Application Files
Dir['./{lib,routers}/**/*.rb'].each do |file|
  require file
end
