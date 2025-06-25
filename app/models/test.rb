class Test < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :user_tests
  has_many :translations, as: :translatable
end
