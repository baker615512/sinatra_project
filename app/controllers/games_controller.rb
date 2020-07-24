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
            redirect "/games/#{@game.id}"
        else
            redirect '/games/new'
        end
    end

    get '/games/:id' do
        set_game
        erb :'/games/show'
    end

    get '/games/:id/edit' do
        set_game
        if logged_in?
            if game.user == current_user
                erb :'/games/edit'
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/games/:id' do
        set_game
        if logged_in?
            if game.user == current_user
                @game.update(game_name: params[:game_name])
                redirect "/games/#{@game.id}"
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    def set_game
        @game = Game.find_by(id: params[:id])
    end
end
