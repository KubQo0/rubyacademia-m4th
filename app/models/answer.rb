class Answer < ApplicationRecord
  belongs_to :question
  has_many :question_user_test
  has_many :translations, as: :translatable
end
