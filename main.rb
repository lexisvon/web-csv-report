require "sinatra"
require_relative "./csv.rb"
require_relative "./add_row_function"
enable :sessions

# Showing the form for login
get '/' do
  erb(:login)
end

get '/user_logged_in' do
	#find info
	user = (name = params["name"], password = params["password"])
	session[:name] = params["name"]
	redirect '/homepage'
end

get'/logout' do
	session.clear
	redirect '/'
end

get '/homepage' do
	erb(:main)
end

get '/account/:name' do
	accounts = run_csv_processer
	name = params["name"]
	erb(:account, :locals => {info: accounts[name], name: name})
end

get '/full' do
	accounts = run_csv_processer
	erb(:full, :locals => {:accounts => accounts})
end

# Showing the form that they type new row values into.
get '/add_row_form' do
  erb(:add_row_form)
end

# Processes the form that they typed new row values into.
get '/add_row' do
  success = add_row_function
  erb(:success)
end
