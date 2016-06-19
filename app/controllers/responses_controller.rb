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
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end


end
