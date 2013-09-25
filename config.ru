require 'json'
require 'debugger'

#require 'rubygems'
#require 'bundler'
#Bundler.require

Encoding.default_external = "UTF-8"
Encoding.default_internal = "UTF-8"

require './webapp'

map '/' do
  map '/' do
    run WebApp.new
  end
end
