class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.where question_id: params[:id]

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      render :new
    end
  end


  private

  def question_params
    params.require(:question).permit(:question_name, :description, :user_id)
  end
end
