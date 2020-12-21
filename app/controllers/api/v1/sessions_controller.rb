class Api::V1::SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            options = {
                include: [:recipes]
            }
            render json: UserSerializer.new(@user, options)
        else
            render json: {
                error: "Invalid Credentials"
            }
        end
    end

    def get_current_user
        if logged_in?
            options = {
                include: [:recipes]
            }
            render json: UserSerializer.new(current_user, options)
        else
            render json: {
                error: "Please Log In"
            }
        end
    end

    def destroy 
        session.clear
        render json: {
            notice: "You are logged out"
        }
    end
end
