class UsersController < ApplicationController

    get '/users/login' do
        erb :'/users/login'
    end

    post '/users/login' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/users/login'
        end
    end

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        if params[:email] != "" && params[:password] != ""
            @user = User.new(params)
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/users/signup'
        end
    end

    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end
end
