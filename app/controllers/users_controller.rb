class UsersController < ApplicationController

    get '/users/login' do
        erb :'/users/login'
    end

    post '/users/login' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/users/#{user.id}"
        else

        end
    end

    get 'users/signup' do

    end

    get '/users/:id' do 
        erb :'users/:id'
    end
end
