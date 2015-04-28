require 'sinatra'
require './dice.rb'

get '/' do
  "hi everyone"
end

get '/diceroll' do
  dice = Dice.new
  number_of_dice = params[:number_of_dice] || 1
  dice.roll(number_of_dice.to_i)

  dice.values.to_s
end
