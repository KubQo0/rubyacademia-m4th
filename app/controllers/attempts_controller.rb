class AttemptsController < ApplicationController
  before_action :set_attempt, only: %i[ show destroy edit update ]
  before_action :set_test

  # GET /user_tests or /user_tests.json
  def index
    @attempts = Attempt.where(test_id: params[:test_id])
  end

  # GET /user_tests/1 or /user_tests/1.json
  def show
  end

  def edit
    @test.questions.each do |question|
      unless @attempt.attempts_questions.any? { |aq| aq.question_id == question.id }
        @attempt.attempts_questions.build(question: question)
      end
    end
  end

  # GET /user_tests/new
  def new
    @attempt = current_user.attempts.build(test: @test)

    @test.questions.each do |question|
      @attempt.attempts_questions.build(question: question)
    end
  end

  # POST /user_tests or /user_tests.json
  def create
    @attempt = current_user.attempts.build(attempt_params.merge(test_id: params[:test_id]))

    if @attempt.save
      redirect_to test_attempts_path, notice: "Attempt created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @attempt.update(attempt_params.merge(test_id: params[:test_id]))
      redirect_to test_attempt_path(@test, @attempt), notice: "Attempt updated."
    else
      @test.questions.each do |question|
        unless @attempt.attempts_questions.any? { |aq| aq.question_id == question.id }
          @attempt.attempts_questions.build(question: question)
        end
      end
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /user_tests/1 or /user_tests/1.json
  def destroy
    @attempt.destroy!

    respond_to do |format|
      format.html { redirect_to test_attempts_path, status: :see_other, notice: "User test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    def set_test
      @test = Test.find(params[:test_id])
    end

    def attempt_params
      params.require(:attempt).permit(:country, :city, :score,
                                      attempts_questions_attributes: [ :id, :written_answer, :answer_id, :time, :question_id ])
    end
end
