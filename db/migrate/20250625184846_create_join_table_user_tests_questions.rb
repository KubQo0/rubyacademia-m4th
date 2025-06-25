class CreateJoinTableUserTestsQuestions < ActiveRecord::Migration[7.2]
  def change
    create_join_table :user_tests, :questions do |t|
      # t.index [:user_test_id, :question_id]
      # t.index [:question_id, :user_test_id]
      t.text :written_answer
      t.integer :time
    end
  end
end
