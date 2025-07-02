class ChangeIsCorrectDefaultOnAnswers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :answers, :is_correct, from: nil, to: true
    change_column_null :answers, :is_correct, false, true
    change_column_default :answers, :body, from: nil, to: ""
    change_column_null :answers, :body, false, ""
  end
end
