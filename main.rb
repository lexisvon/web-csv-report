require "sinatra"
require_relative "./csv.rb"

get '/myhomepage' do
	run_csv_processer 
	accounts.each do |name, info|
	end
	erb(:main)
end



