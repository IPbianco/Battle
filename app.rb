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
    @pl1 = Game.show.player1
    @pl2 = Game.show.player2
    @current_player = Game.show.current_player.name
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  post '/names' do
    player_1 = Player.new(params[:player1])
    player_2 = Player.new(params[:player2])
    Game.store(Game.new(player_1, player_2))
    redirect "/play"
  end

  post "/punch" do
    Game.show.punch
    session[:attack_confirmation] = Game.show.confirmation
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
