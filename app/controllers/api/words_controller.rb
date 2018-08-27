require 'net/http'
require "uri"
require 'faraday'

class Api::WordsController < ApplicationController
    def index
        conn = Faraday.new
        response = conn.get 'http://app.linkedin-reach.io/words'
        @words = response.body.split("\n")
        render json: @words
    end

    def new
    end

    def create
    end

    def show
    end

    def get
        difficulty = params[:difficulty]
        # uri = URI.parse(`http://app.linkedin-reach.io/words?difficulty=#{params[:difficulty]}&minLength=4`)
        
        conn = Faraday.new
        # response = conn.get `http://app.linkedin-reach.io/words?difficulty=#{params[:difficulty]}&minLength=4`
        response = conn.get 'http://app.linkedin-reach.io/words?difficulty=3&minLength=4'
        @words = response.body.split("\n")
        # binding.pry
        render json: @words
    end


    private
    def word_params
        params.require(:word).permit(:difficulty)
    end
end
