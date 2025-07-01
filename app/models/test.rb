class Test < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :attempts, dependent: :delete_all
  has_many :translations, as: :translatable

  validates :title, presence: true
  validate :must_have_at_least_one_question

  def must_have_at_least_one_question
    if question_ids.empty?
      errors.add(:questions, "must include at least one question")
    end
  end
end
