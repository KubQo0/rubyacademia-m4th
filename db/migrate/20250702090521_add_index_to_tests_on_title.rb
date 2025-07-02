class AddIndexToTestsOnTitle < ActiveRecord::Migration[7.2]
  def change
    add_index :tests, :title
  end
end
