class ChangeIsMultichoiceDefaultOnQuestions < ActiveRecord::Migration[7.2]
  def change
    change_column_default :questions, :is_multichoice, from: nil, to: true
    change_column_null :questions, :is_multichoice, false, true
  end
end
