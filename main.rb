require "Sinatra"

get '/myhomepage' do
	erb(:main)	
end