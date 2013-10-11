require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'pry' if development?
require_relative 'config/environments'
require_relative 'models/show'
require_relative 'models/song'

after do
  ActiveRecord::Base.clear_active_connections!
end

helpers do; end

get '/' do; end

