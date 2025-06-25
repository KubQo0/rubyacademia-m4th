class Question < ApplicationRecord
  has_many :answers
  has_many :question_user_tests
  has_many :user_tests, through: :question_user_tests
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :categories
  has_many :translations, as: :translatable
end
