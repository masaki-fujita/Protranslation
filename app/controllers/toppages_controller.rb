class ToppagesController < ApplicationController
  
  def search_results
    @word = params[:search_word]
    
    require "unirest"

    response = Unirest.get "https://wordsapiv1.p.rapidapi.com/words/#{@word}",
    headers:{
      "X-RapidAPI-Host" => "wordsapiv1.p.rapidapi.com",
      "X-RapidAPI-Key" => "5686a7df03msh2d311fd7a2aa48ep193105jsn2d65e7d6a423"
    }
    
    @signals = response.body["pronunciation"]["all"]

  end 
end
