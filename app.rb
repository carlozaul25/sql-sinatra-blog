require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, 'sqlite3:whatever.sqlite3'
