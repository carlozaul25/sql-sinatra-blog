require 'sinatra'
require 'sinatra/activerecord'
require './models'
set :database, 'sqlite3:users.sqlite3'



get "/" do

@users = User.all

erb :"users/index"
end
