class QuestionsController < ApplicationController
  before_action :require_logged_user, only: [:new, :create]
  
  layout "window", except: [:index, :show]

  def index
    @questions = Question.limit(20).includes(:user).order(:created_at)
    # alternative making one query with join
    # @questions = Question.limit(20).joins(:user).includes(:user)
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
    @question = Question.find(params[:id])
    @question.viewed!
    @answers = @question.answers
  end

  def remove
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to root_path, notice: "Pergunta removida com sucesso!"
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :category_id)
  end
end