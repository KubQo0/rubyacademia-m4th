class User < ApplicationRecord
  has_many :attempts, dependent: :delete_all

  devise :database_authenticatable, :registerable, :validatable
  validates :given_name, :family_name, presence: true
end
