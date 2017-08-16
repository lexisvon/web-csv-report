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

def logged_in
  if session[:name] != nil
    return true
  end
end

def logged_in_as(account)
    if session[:name].downcase == account.downcase
      return true
    end
end

get '/account/:name' do
  if logged_in_as(params["name"])
  	accounts = run_csv_processer
  	name = params["name"]
  	erb(:account, :locals => {info: accounts[name], name: name})
  else
    redirect "/"
  end
end

get '/full' do
 if logged_in
	accounts = run_csv_processer
	erb(:full, :locals => {:accounts => accounts})
 else
    redirect "/"
 end
end

# Showing the form that they type new row values into.
get '/add_row_form' do
if logged_in
  erb(:add_row_form)
 else
    redirect "/"
 end
end

# Processes the form that they typed new row values into.
get '/add_row' do
 if logged_in
  success = add_row_function
  erb(:success)
 else
    redirect "/"
 end
end
