require "sinatra"
require_relative "./csv.rb"
require_relative "./add_row_function"
enable :sessions

USERS = {
  "sonia" => "imsonia",
  "priya" => "impriya"
}

# Showing the form for login
get '/' do
  erb(:login)
end

get '/user_logged_in' do
	#find info
	name = params["name"]
  password = params["password"]

  if USERS.has_key?(name) && (password == USERS[name])
    session[:name] = name
    redirect "/account/#{name.capitalize}"
  else
    redirect '/'
  end
end

get'/logout' do
	session.clear
	redirect '/'
end

get '/homepage' do
	erb(:main)
end

def logged_in(account_name)
  if session[:name] != nil
    if session[:name].downcase == account_name.downcase
      return true
    else
      return false
    end
  end
end

get '/account/:name' do
  if logged_in(params["name"])
  	accounts = run_csv_processer
  	name = params["name"]
  	erb(:account, :locals => {info: accounts[name], name: name})
  else
    redirect "/"
  end
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
