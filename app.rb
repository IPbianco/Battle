require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    session[:attack_confirmation] = nil
    erb :index
  end

  get "/play" do
    @pl1 = $game.player1
    @pl2 = $game.player2
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  post '/names' do
    player_1 = Player.new(params[:player1])
    player_2 = Player.new(params[:player2])
    $game = Game.new(player_1, player_2)
    redirect "/play"
  end

  post "/attack" do
    $game.attack
    if $game.turn == 2
      session[:attack_confirmation] = "#{$game.player1.name} attacked #{$game.player2.name}."
    else
      session[:attack_confirmation] = "#{$game.player2.name} attacked #{$game.player1.name}."
    end
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
