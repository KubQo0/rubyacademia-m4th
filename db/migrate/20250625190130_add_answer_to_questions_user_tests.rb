class AddAnswerToQuestionsUserTests < ActiveRecord::Migration[7.2]
  def change
    add_reference :questions_user_tests, :answers, null: false, foreign_key: true
  end
end
