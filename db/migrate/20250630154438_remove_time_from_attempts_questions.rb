class RemoveTimeFromAttemptsQuestions < ActiveRecord::Migration[7.2]
  def change
    remove_column :attempts_questions, :time
  end
end
