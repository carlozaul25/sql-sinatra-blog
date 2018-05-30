<<<<<<< HEAD
require 'sinatra'
require 'sinatra/activerecord'
require './models'
set :database, 'sqlite3:users.sqlite3'



get "/" do

@users = User.all

erb :"users/index"
end
=======
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

# Login

get "/login" do 
	erb :'users/login'
end

post "/login" do 
	user = User.where(username: params[:username]).first
	if user.password == params[:password]
		session[:user_id] = user.id
		redirect "/"
	else 
		redirect "/login"
	end
	end

	post "/logout" do
	session[:user_id] = nil
	redirect "/login"
end

get "/blogs" do 
	@blogs = Blog.all
	erb :"blogs/index"
end





>>>>>>> 149f1dd39b0c0b3c82f90e3755fcd13bb801ca17
