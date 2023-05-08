require "json"
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @answer = params[:answer]
    @letter = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)
  end
end
