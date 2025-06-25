class CreateJoinTableTestsQuestions < ActiveRecord::Migration[7.2]
  def change
    create_join_table :tests, :questions do |t|
      # t.index [:test_id, :question_id]
      # t.index [:question_id, :test_id]
    end
  end
end
