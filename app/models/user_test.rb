class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :question_user_tests
  has_many :questions, through: :question_user_tests
end
