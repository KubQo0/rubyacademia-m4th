class CategoriesController < ApplicationController
  before_action :setup_question

  def new
  end

  def destroy
    respond_to do |format|
      format.turbo_stream # Will render destroy.turbo_stream.erb
      format.html { head :no_content }
    end
  end

  private

  def setup_question
    @question = Question.new
    @question.categories.build
  end
end
