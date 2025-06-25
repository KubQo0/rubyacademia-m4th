class Question < ApplicationRecord
  has_many :answers
  has_and_belongs_to_many :user_tests
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :categories
end
