require "sinatra"
require_relative "./csv.rb"
require "pry"

get '/homepage' do
	erb(:main)
end

get '/full' do
	accounts = run_csv_processer
	erb(:full, :locals => {:accounts => accounts})
end

get '/account' do
	accounts = run_csv_processer
	erb(:account, :locals => {:accounts => accounts})
end
