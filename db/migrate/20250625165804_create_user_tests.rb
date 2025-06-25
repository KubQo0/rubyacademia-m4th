class CreateUserTests < ActiveRecord::Migration[7.2]
  def change
    create_table :user_tests do |t|
      t.integer :score
      t.string :country
      t.string :city
      t.timestamps
    end
  end
end
