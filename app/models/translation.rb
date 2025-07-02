class Translation < ApplicationRecord
  belongs_to :translatable, polymorphic: true
  #
  # enum locale: { en: 0, sk: 1, de: 2 }
  #
  # validates :locale, presence: true
  # validates :key, presence: true
  # validates :value, presence: true
end
