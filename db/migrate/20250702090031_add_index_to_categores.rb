class AddIndexToCategores < ActiveRecord::Migration[7.2]
  def change
    add_index :categories, :title
  end
end
