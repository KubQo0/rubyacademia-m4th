class AddUserToUserTests < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_tests, :user, null: false, foreign_key: true
  end
end
