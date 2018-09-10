class Api::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: [:edit, :update, :show]

    def signup
        user = User.new(user_params)
        if user.save
            render json: { token: Auth.create_token({ id: user.id, username: user.username, score: user.score }) }
        else
            render json: { errors: { message: user.errors.full_messages } }, status: 401 
        end
    end

    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: { errors: { message: @user.errors.full_messages } }, status: 401 
        end
    end

    def show
        render json: @user
    end

    def leaderboard
        @users = User.order("score DESC").limit(10)

        if @users
            render json: { users: @users }
        else
            render json: { errors: { message: "Unable to obtain leaderboard data" } }, status: 401
        end
    end

    private
    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:id, :username, :password, :score)
    end
end