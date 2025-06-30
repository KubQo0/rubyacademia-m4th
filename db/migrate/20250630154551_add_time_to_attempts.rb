class AddTimeToAttempts < ActiveRecord::Migration[7.2]
  def change
    add_column :attempts, :time, :integer
  end
end
