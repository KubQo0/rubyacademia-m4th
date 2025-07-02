class ChangeScoreDefaultOnAttempts < ActiveRecord::Migration[7.2]
  def change
    change_column_default :attempts, :score, from: nil, to: 0
    change_column_null :attempts, :score, false, 0
    change_column_default :attempts, :time, from: nil, to: 0
    change_column_null :attempts, :time, false, 0
  end
end
