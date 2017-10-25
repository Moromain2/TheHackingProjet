require 'sinatra'
require 'sinatra/reloader'

  get '/' do
    @number = 45
    @secret_number = rand(0..100)
    erb :index
    params["guess"].to_i
  end
