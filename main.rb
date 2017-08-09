require "sinatra"
require_relative "./csv.rb"
require "pry"

get '/homepage' do
	erb(:main)
end

get '/account/:name' do
	accounts = run_csv_processer
	@name = params["name"]
	erb(:account, :locals => {:accounts => accounts})
end
