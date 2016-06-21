class FavoriteQuestionsController < ApplicationController
	before_action :set_question
	before_action :authenticate_user!
  
  def create
    if Favorite.create(favorited: @question, user: current_user)
      redirect_to :back, notice: 'Question has been favorited'
    else
      redirect_to :back, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @question.id, user_id: current_user.id).first.destroy
    redirect_to :back, notice: 'Question is no longer in favorites'
  end
  
  private
  
  def set_question
    @question = Question.find(params[:question_id] || params[:id])
  end
end
