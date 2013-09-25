# -*- coding: utf-8 -*-

require "sinatra"
require "sinatra/synchrony"
require "sinatra/activerecord"

SYNCHRONY = true

class Orrange < ActiveRecord::Base; end

class WebApp < Sinatra::Base
  use Rack::CommonLogger  # sinatra-synchronyを使うとなぜかデフォルトが消える

  register Sinatra::Synchrony

  configure do
    ActiveRecord::Base::establish_connection(
      :adapter => SYNCHRONY ? "em_mysql2" : "mysql2",
      :database => 'synchrony',
      :username => 'root',
      :password => 'root',
      :pool => 10
      )
  end

  get '/' do
    orrange = Orrange.new
    orrange.title = 'hello'
    begin
      orrange.save
    rescue => e
      open("error.txt", "a") do |file|
        file.puts e
        # file.puts e.backtrace
        puts e
        puts e.backtrace
      end
    end

    'hello world'
  end
end


