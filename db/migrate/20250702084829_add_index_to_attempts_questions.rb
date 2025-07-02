class AddIndexToAttemptsQuestions < ActiveRecord::Migration[7.2]
  def change
    add_index :attempts_questions, :attempt_id
    add_index :attempts_questions, :question_id
  end
end
