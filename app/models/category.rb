class Category < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :translations, as: :translatable

  validates :title, presence: true
end
