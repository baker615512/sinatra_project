class UsersController < ApplicationController

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/login'
        end
    end

    get '/signup' do
        erb :'/users/new'
    end

    post '/users' do
        if params[:email] != "" && params[:password] != ""
            @user = User.new(params)
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/signup'
        end
    end

    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end
