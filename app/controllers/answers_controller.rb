class AnswersController < ApplicationController
  before_action :setup_question

  def new
  end

  def destroy
  end

  private

  def setup_question
    @question = Question.new
    @question.answers.build
  end
end
