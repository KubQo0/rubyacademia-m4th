class AttemptsQuestion < ApplicationRecord
  belongs_to :answer
  belongs_to :attempt
  belongs_to :question
end
