require "sinatra"
require_relative "./csv.rb"
require "pry"

get '/myhomepage' do
	accounts = run_csv_processer
end

get '/full' do
	run_csv_processer
end

get '/account' do
	accounts = run_csv_processer
	erb(:account, :locals => {:accounts => accounts})
end
