
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

	def current_bloger
	if(session[:user_id])
		@current_bloger = User.find(session[:user_id])
	end
end

	# blogs

	get "/posts" do 
	@blogs = Blog.all
	erb :"posts/index"
end

# create blogs

get "/blogs/new" do  
	erb :"posts/new"
end


post "/create_blog" do 
	if !session[:user_id]
		redirect "/login"
	else
	current_bloger = User.find(session[:user_id])
	Blog.create(title: params[:title], content: params[:content], user_id: current_bloger.id)
	redirect "/posts"
end
end

# 	def destroy 
# 	@Blogs = Blog.find(params[:user_id])
# 	blogs.destroy
# 	redirect 'blogs'
# end




