class AnswersController < ApplicationController
  before_action :setup_question

  def new
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy! if @answer

    respond_to do |format|
      format.turbo_stream
      format.html { head :no_content }
    end
  end

  private

  def setup_question
    @question = Question.new
    @question.answers.build
  end
end
