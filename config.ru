require 'bundler'
Bundler.require
require './config/environment'
require 'sinatra/base'
require './app'
run OwnlocalAPI 
