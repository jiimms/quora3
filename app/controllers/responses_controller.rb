class ResponsesController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	def create
		@question = Question.find(params[:question_id])
		@response = @question.responses.create(params[:response].permit(:answer))
		@response.user_id = current_user.id if current_user
		@response.save
		if@response.save
			redirect_to question_path(@question)
		else
			render :new
		end
	end
end
