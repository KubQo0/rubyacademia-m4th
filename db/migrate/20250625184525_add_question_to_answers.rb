class AddQuestionToAnswers < ActiveRecord::Migration[7.2]
  def change
    add_reference :answers, :questions, null: false, foreign_key: true
  end
end
