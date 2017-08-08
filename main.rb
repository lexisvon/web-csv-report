require "sinatra"
require_relative "./csv.rb"

get '/myhomepage' do
	account = run_csv_processer 
	erb(:main)
end



