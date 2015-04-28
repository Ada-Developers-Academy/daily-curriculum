require 'sinatra'

class MyApp < Sinatra::Base
  
  get "/" do
    erb :index
  end
  
end