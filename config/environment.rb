require 'rubygems'
require 'bundler'
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

environment = ENV.fetch('RACK_ENV') { 'development' }
db_options = YAML.load(File.read('./config/database.yml'))[environment]
ActiveRecord::Base.establish_connection(db_options)
