require 'faraday'

class Api::WordsController < ApplicationController
    def index
        conn = Faraday.new
        response = conn.get 'http://app.linkedin-reach.io/words'
        @words = response.body.split("\n")

        if @words
            render json: @words
        else
            render json: { errors: { message: "Unable to retrieve dictionary data" } }, status: 401
        end
    end

    def easy
        conn = Faraday.new
        response = conn.get 'http://app.linkedin-reach.io/words?difficulty=1&minLength=4'
        @words = response.body.split("\n")

        if @words
            render json: @words
        else
            render json: { errors: { message: "Unable to retrieve dictionary data" } }, status: 401
        end
    end

    def normal
        conn = Faraday.new
        response = conn.get 'http://app.linkedin-reach.io/words?difficulty=3&minLength=4'
        @words = response.body.split("\n")

        if @words
            render json: @words
        else
            render json: { errors: { message: "Unable to retrieve dictionary data" } }, status: 401
        end
    end

    def hard
        conn = Faraday.new
        response = conn.get 'http://app.linkedin-reach.io/words?difficulty=5&minLength=4'
        @words = response.body.split("\n")

        if @words
            render json: @words
        else
            render json: { errors: { message: "Unable to retrieve dictionary data" } }, status: 401
        end
    end

    def bananas
        conn = Faraday.new
        response = conn.get 'http://app.linkedin-reach.io/words?difficulty=10&minLength=4'
        @words = response.body.split("\n")

        if @words
            render json: @words
        else
            render json: { errors: { message: "Unable to retrieve dictionary data" } }, status: 401
        end
    end

    # def difficulty
    #     difficulty = params[:difficulty]
    #     uri = `http://app.linkedin-reach.io/words?difficulty=#{difficulty}`
        
    #     conn = Faraday.new
    #     response = conn.get uri
    #     @words = response.body.split("\n")
    #     # binding.pry
    #     render json: @words
    # end

    private
    def word_params
        params.require(:word).permit(:difficulty)
    end
end
