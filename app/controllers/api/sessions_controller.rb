require 'auth'

class Api::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = Auth.create_token({ id: user.id, username: user.username })
            render json: { user: { id: user.id, username: user.username, score: user.score }, token: token}
        else
            render json: { errors: { message: "Unable to find a user with that username or password" } }, status: 401
        end
    end

    def find
        current_user = Auth.decode_token(params[:token])
        if current_user
            # binding.pry
            render json: { user: current_user }
        else
            render json: { errors: { message: "Unable to find user" } }, status: 401
        end
    end
end