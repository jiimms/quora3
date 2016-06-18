class QuestionsController < ApplicationController
	before_action :set_q, except: [:index, :new, :create]
	 before_action :authenticate_user!, except: [:index, :show, ]
  def new
  	@question=Question.new
  end

  def create
  	@question=Question.new(question_params)
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

  private 
		def set_q
			@question=Question.find(params[:id])
		end
  	def question_params
  		params.require(:question).permit(:title)
  	end
end
