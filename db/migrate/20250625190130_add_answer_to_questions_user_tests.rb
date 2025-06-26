class AddAnswerToQuestionsUserTests < ActiveRecord::Migration[7.2]
  def change
    add_reference :questions_user_tests, :answer, null: false, foreign_key: true
  end
end
