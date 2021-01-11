class Api::V1::UsersController < ApplicationController
  # GET /users
  def index
    users = User.all
        options = {
            include: [:recipes]
        }
        render json: UserSerializer.new(users, options)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
