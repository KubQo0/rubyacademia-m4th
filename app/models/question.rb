class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :attempts_questions, dependent: :delete_all
  has_many :user_tests, through: :attempts_questions
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :categories
  has_many :translations, as: :translatable
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true

  validates :assignment, presence: true
  validates :is_multichoice, inclusion: { in: [ true, false ] }
  validate :must_have_at_least_one_answer

  private

  def must_have_at_least_one_answer
    actual_answers = answers.reject { |a| a.marked_for_destruction? || a.body.blank? }

    if actual_answers.empty?
      errors.add(:answers, :one_answer)
    end
  end
end
