require 'sinatra'  
  require 'sinatra/activerecord'
  require './models'    
  set :database, 'sqlite3:users.sqlite3'
  set :sessions, true

get "/" do  

@users = User.all
erb :"users/index"
end

# signup

get "/signup" do 
	erb :'users/signup'
end  

post "/create" do 
	User.create(username: params[:username], password: params[:password])
	redirect "/"
end
