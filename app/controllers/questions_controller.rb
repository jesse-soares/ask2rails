class QuestionsController < ApplicationController
  before_action :require_logged_user, only: [:new, :create]

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    
    if @question.save
      redirect_to question_path(@question), notice: t("flash.questions.create.notice")
    else
      render :new
    end
  end

  def show
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :category_id)
  end
end