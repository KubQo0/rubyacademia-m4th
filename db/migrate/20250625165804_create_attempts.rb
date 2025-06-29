class CreateAttempts < ActiveRecord::Migration[7.2]
  def change
    create_table :attempts do |t|
      t.integer :score
      t.string :country
      t.string :city
      t.timestamps
    end
  end
end
