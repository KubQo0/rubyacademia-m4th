class AddTestToUserTests < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_tests, :test, null: false, foreign_key: true
  end
end
