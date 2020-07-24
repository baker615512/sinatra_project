class GamesController < ApplicationController

    get '/games/index' do
        @board_games = BoardGame.all 
        erb :'/games/index'
    end

    get '/games/new' do
        erb :'/games/new'
    end

    post '/games' do
        if !logged_in?
            redirect '/'
        end
        if params[:game_name] != ""
            @board_game = BoardGame.create(game_name: params[:game_name], user_id: current_user.id)
            redirect "/games/#{@board_game.id}"
        else
            redirect '/games/new'
        end
    end

    get '/games/:id' do
        set_board_game
        erb :'/games/show'
    end

    get '/games/:id/edit' do
        set_board_game
        if logged_in?
            if board_game.user == current_user
                erb :'/games/edit'
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/games/:id' do
        set_board_game
        if logged_in?
            if board_game.user == current_user && params[:game_name] != ""
                @board_game.update(game_name: params[:game_name])
                redirect "/games/#{@board_game.id}"
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    delete '/games/:id' do
        set_board_game
        if board_game.user == current_user
            @board_game.destroy
            redirect "/users/#{current_user.id}"
        else
            redirect '/games/index'
        end
    end

    def set_board_game
        @board_game = BoardGame.find_by(id: params[:id])
    end
end
