require "sinatra"
require_relative "./csv.rb"
require "pry"

get '/myhomepage' do
	erb(:main)
end

get '/full' do
	accounts = run_csv_processer
	erb(:full)
end

get '/account/Priya' do
	accounts = run_csv_processer
	erb(:account, :locals => {:accounts => accounts})
end
