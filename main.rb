require "sinatra"
require_relative "./csv.rb"

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
