class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.boolean :is_correct
      t.text :body
      t.timestamps
    end
  end
end
