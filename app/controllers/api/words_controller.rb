class Api::WordsController < ApplicationController
    def index
        @words = Words.all
        render json: @words
    end

    def easy
        words = Word.all.where("difficulty" => 1)
        @word = words.sample
        render json: @word.word
    end

    def normal
        words = Word.all.where("difficulty" => 2)
        @word = words.sample
        render json: @word.word
    end

    def hard
        words = Word.all.where("difficulty" => 3)
        @word = words.sample
        render json: @word.word
    end

    def bananas
        words = Word.all.where("difficulty" => 9)
        @word = words.sample
        render json: @word.word
    end

    private
    def word_params
        params.require(:word).permit(:difficulty)
    end
end
