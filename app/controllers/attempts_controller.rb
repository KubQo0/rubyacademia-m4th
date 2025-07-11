class AttemptsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attempt, only: %i[ destroy edit update ]
  before_action :set_test

  # GET /user_tests or /user_tests.json
  def index
    @attempts = current_user.attempts.includes(:questions).where(test_id: params[:test_id])
  end

  # GET /user_tests/1 or /user_tests/1.json
  def show
    @attempt = Attempt.includes(:attempts_questions).find(params[:id])
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
      evaluate(@attempt)
      redirect_to test_attempts_url, notice: "Attempt created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @attempt.update(attempt_params.merge(test_id: params[:test_id]))
      redirect_to test_attempt_url(@test, @attempt), notice: "Attempt updated."
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
      format.html { redirect_to test_attempts_url, status: :see_other, notice: "User test was successfully destroyed." }
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

  def evaluate(attempt)
    points = 0

    attempt.attempts_questions.includes(:answer).each do |aq|
      if aq.answer&.is_correct
        points += 1
      end
    end

    attempt.update(score: points)
  end
end
