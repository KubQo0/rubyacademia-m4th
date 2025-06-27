class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions_user_tests, dependent: :delete_all
  has_many :user_tests, through: :questions_user_tests
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :categories
  has_many :translations, as: :translatable
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true

  validates :assignment, presence: true
  validates :is_multichoice, inclusion: { in: [ true, false ] }
end
