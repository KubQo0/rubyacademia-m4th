class AddForeignKeysToTables < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :attempts_questions, :attempts
    add_foreign_key :attempts_questions, :questions

    add_foreign_key :categories_questions, :categories
    add_foreign_key :categories_questions, :questions

    add_foreign_key :questions_tests, :questions
    add_foreign_key :questions_tests, :tests
  end
end

