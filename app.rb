require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/flash'

configure(:development){set :database, {adapter: 'sqlite3', database: 'blog.sqlite3' }}

enable :sessions

def current_user    
	if session[:user_id]      
		@current_user = User.find(session[:user_id])    
	end  
end 


get '/' do
  @users = User.all
  erb :users
end

post '/users' do
  @user = User.create(params)
  redirect to("/")
end

# edit
put '/users/:id' do
end

get '/login' do
	erb :login
end

post '/login' do
  @user = User.find_by(username: params[:username])  
  if @user && @user.password == params[:password] 
  	session[:user_id] = @user.id   
  	flash[:notice] = "User signed in successfully." 
  	redirect '/'  
  else
  	flash[:alert] = "Login NOT successfull"  
  	redirect '/login'  
  end 
end


# :id indicates a dynamic route.
get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end


get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end

  # Post.create(user_id: params[:id], title: "My First Blog Post", content: "This is the #{@user.first_name}'s short blog post to show you as an example.")
