class Answer < ApplicationRecord
  belongs_to :question
  has_many :questions_user_test, dependent: :delete_all
  has_many :translations, as: :translatable

  validates :body, presence: true
  validates :is_correct, inclusion: { in: [ true, false ] }
end
