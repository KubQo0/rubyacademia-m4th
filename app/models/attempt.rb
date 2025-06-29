class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :attempts_questions, dependent: :delete_all
  has_many :questions, through: :attempts_questions
  accepts_nested_attributes_for :attempts_questions
end
