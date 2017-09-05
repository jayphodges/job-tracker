class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :comments
  has_many :contacts
  has_many :jobs, dependent: :destroy
end
