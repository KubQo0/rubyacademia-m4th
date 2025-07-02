class AddIndexToQuestionsOnAssignment < ActiveRecord::Migration[7.2]
  def change
    add_index :questions, :assignment
  end
end
