class QuestionsUserTest < ApplicationRecord
  belongs_to :answer
  belongs_to :user_test
  belongs_to :question
end
