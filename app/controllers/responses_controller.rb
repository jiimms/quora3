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

	def edit
		
		@question = Question.find(params[:question_id])
		@response = @question.responses.find(params[:id])
	end

	def update

		@question = Question.find(params[:question_id])
		@response = @question.responses.find(params[:id])

		if @response.update(params[:response].permit(:answer))
			redirect_to question_path(@question)
		else
			render 'edit'
		end
	end

	def destroy
		@question = Question.find(params[:question_id])
		@response = @question.responses.find(params[:id])
		@response.destroy
		redirect_to question_path(@question)
	end

def upvote 
	
	@response= Response.find(params[:id])
  	@response.upvote_by current_user
  	redirect_to :back
  end

  def downvote 
  	@response= Response.find(params[:id])
  	@response.downvote_by current_user
  	redirect_to :back
  end
end
