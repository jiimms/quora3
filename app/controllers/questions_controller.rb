class QuestionsController < ApplicationController
	before_action :set_q, only: [:edit, :update, :show, :destroy]
	 before_action :authenticate_user!, except: [:index, :show, ]
  def new
  	@question=current_user.questions.build
  end

  def create
  	@question=current_user.questions.build(question_params)
  	if @question.save
  		redirect_to @question
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @question.update(question_params)
  		redirect_to root_path
  	else
  		render :edit
  	end  			
  end

  def index
  	@questions=Question.all
  end

  def show
  end

  def destroy
  	@question.delete
  	redirect_to root_path
  end

  def upvote 
    @question=Question.find(params[:id])
  	@question.upvote_by current_user
  	redirect_to :back
  end

  def downvote
    @question=Question.find(params[:id])
  	@question.downvote_by current_user
  	redirect_to :back
  end

  private 
		def set_q
			@question=Question.find(params[:id])
		end
  	def question_params
  		params.require(:question).permit(:title)
  	end
end
