class TestsController < ApplicationController
  require "csv"

  before_action :authenticate_user!
  before_action :check_admin, only: %i[ show edit update destroy ]
  before_action :set_test, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy!

    respond_to do |format|
      format.html { redirect_to tests_url, status: :see_other, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    file = params[:file]
    return redirect_to tests_url, alert: "Invalid file" unless file&.content_type&.include?("csv")

    csv = CSV.parse(file.read, headers: false, col_sep: ";")

    tests = {}

    csv.each do |row|
      test_title = row[0]&.strip
      question_text = row[1]&.strip
      is_multichoice = row[2].to_s.strip == "1"
      category = row[3]&.strip
      answer_text = row[4]&.strip
      is_correct = row[5].to_s.strip == "1"

      next if test_title.blank? || question_text.blank? || answer_text.blank?

      # Find or create the test
      test = tests[test_title] ||= Test.find_or_initialize_by(title: test_title)
      test.save(validate: false) unless test.persisted?

      # Find or create the question globally
      question = Question.find_or_create_by(assignment: question_text)
      question.is_multichoice = is_multichoice
      question.save(validate: false) if question.changed?

      # Associate the question with the test
      test.questions << question unless test.questions.exists?(question.id)

      cat = Category.find_or_create_by(title: category)

      question.categories << cat unless question.categories.exists?(cat.id)

      unless question.answers.exists?(body: answer_text, is_correct: is_correct)
        question.answers.create(body: answer_text, is_correct: is_correct)
      end
    end

    redirect_to tests_url, notice: "Import successful"
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:title, question_ids: [])
    end
end
