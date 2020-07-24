class GamesController < ApplicationController

    get '/games/new' do
        erb :'/games/new'
    end

    post '/games' do
        if !logged_in?
            redirect '/'
        end
        if params[:game_name] != ""
            @game = Game.create(game_name: params[:game_name], user_id: current_user.id)
            redirect "/games/#{@game.id}
        else
            redirect '/games/new'
        end
    end
end
