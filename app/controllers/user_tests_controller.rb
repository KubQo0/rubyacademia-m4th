class UserTestsController < ApplicationController
  before_action :set_user_test, only: %i[ show edit update destroy ]

  # GET /user_tests or /user_tests.json
  def index
    @user_tests = UserTest.all
  end

  # GET /user_tests/1 or /user_tests/1.json
  def show
  end

  # GET /user_tests/new
  def new
    @user_test = UserTest.new
  end

  # GET /user_tests/1/edit
  def edit
  end

  # POST /user_tests or /user_tests.json
  def create
    @user_test = UserTest.new(user_test_params)

    respond_to do |format|
      if @user_test.save
        format.html { redirect_to @user_test, notice: "User test was successfully created." }
        format.json { render :show, status: :created, location: @user_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tests/1 or /user_tests/1.json
  def update
    respond_to do |format|
      if @user_test.update(user_test_params)
        format.html { redirect_to @user_test, notice: "User test was successfully updated." }
        format.json { render :show, status: :ok, location: @user_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tests/1 or /user_tests/1.json
  def destroy
    @user_test.destroy!

    respond_to do |format|
      format.html { redirect_to user_tests_path, status: :see_other, notice: "User test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_test
      @user_test = UserTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_test_params
      params.fetch(:user_test, {})
    end
end
