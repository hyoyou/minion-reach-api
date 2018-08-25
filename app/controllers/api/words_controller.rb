require 'net/http'

class Api::WordsController < ApplicationController
    def index
        get_all = Net::HTTP.get(URI.parse('http://app.linkedin-reach.io/words'))
        @words = get_all.split("\n")
        render json: @words
    end

    
end
