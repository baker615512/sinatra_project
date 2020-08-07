class GamesController < ApplicationController
    
    get '/games' do
        @board_games = BoardGame.all 
        erb :'/games/index'
    end

    get '/games/new' do
        erb :'/games/new'
    end

    post '/games' do
        redirect_if_not_logged_in
        @board_game = current_user.board_games.new(params)
        if !@board_game.save
            redirect "/games/new"
        else
            redirect "/games/#{@board_game.id}"
        end
    end

    get '/games/:id' do
        set_board_game
        erb :'/games/show'
    end

    get '/games/:id/edit' do
        set_board_game
        redirect_if_not_logged_in
        if @board_game.user == current_user
            erb :'/games/edit'
        else
            redirect "/users/#{current_user.id}"
        end
    end

    patch '/games/:id' do
        set_board_game
        redirect_if_not_logged_in
        if @board_game.user == current_user && params[:game_name] != ""
            @board_game.update(game_name: params[:game_name])
            redirect "/games/#{@board_game.id}"
        else
            redirect "/users/#{current_user.id}"
        end
    end

    delete '/games/:id' do
        set_board_game
        if @board_game.user == current_user
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
