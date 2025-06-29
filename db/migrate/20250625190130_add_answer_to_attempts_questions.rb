class AddAnswerToAttemptsQuestions < ActiveRecord::Migration[7.2]
  def change
    add_reference :attempts_questions, :answer, null: false, foreign_key: true
  end
end
