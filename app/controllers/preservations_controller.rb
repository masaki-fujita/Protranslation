class PreservationsController < ApplicationController
  
  def index
    if logged_in?
      @preservations = current_user.preservations.order(:id).page(params[:page])
    end 
  end

  def show
    @preservation = current_user.preservations.find(params[:id])
  end

  def new
    @preservation = current_user.preservations.new
    search_results
    
  
  end

  def create
    @preservation = current_user.preservations.build(preservation_params)
    if @preservation.save
      flash[:success] = "保存成功"
      redirect_to root_url
    else
      @preservation = current_user.preservations.new
      flash[:danger] = "保存失敗"
      render "preservations/new"
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end 
  def logged_in?
    !!current_user
  end 

  def preservation_params
    params.require(:preservation).permit(:title, :content_sentence, :content_signals)
  end 
end
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