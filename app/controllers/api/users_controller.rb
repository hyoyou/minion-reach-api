class Api::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: [:show]

    def signup
        user = User.new(user_params)
        if user.save
            render json: { token: Auth.create_token(user) }
        else
            render json: { errors: user.errors.full_messages }, status: 401 
        end
    end

    def leaderboard
        # Sort users by score then grab first 10
    end

    def show
        render json: @user
    end

    private
    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :score)
    end
end