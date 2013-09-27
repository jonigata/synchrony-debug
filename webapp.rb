# -*- coding: utf-8 -*-

require 'active_record'


class Orange < ActiveRecord::Base; end

class WebApp < Sinatra::Base
  use Rack::CommonLogger  # sinatra-synchronyを使うとなぜかデフォルトが消える

  register Sinatra::Synchrony

  configure do
    ActiveRecord::Base::establish_connection(
      :adapter => "em_mysql2",
      :database => 'synchrony',
      :username => 'root',
      :password => 'root',
      :pool => 10
      )
  end

  get '/' do
    orange = Orange.new
    orange.title = 'hello'
    begin
      orange.save
    rescue => e
      open("error.txt", "a") do |file|
        file.puts e
        # file.puts e.backtrace
        puts e
      end
      raise
    end

    'hello world'
  end
end


