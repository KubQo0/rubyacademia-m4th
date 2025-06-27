class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :questions_user_tests, dependent: :delete_all
  has_many :questions, through: :questions_user_tests
end
