require "sinatra"
require_relative "./csv.rb"

get '/myhomepage' do
	
	erb(:main)
end

get '/full' do
	account = run_csv_processer 
	erb(:full)
end

get '/account' do
	account = run_csv_processer
	erb(:account)
end
