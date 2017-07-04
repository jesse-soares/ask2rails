class AnswersController < ApplicationController
  before_action :require_logged_user

  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = t("flash.answers.create.notice")
    else
      flash[:alert] = @answer.errors.full_messages.to_sentence
    end

    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end