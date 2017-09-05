class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category, optional: true

  def self.jobs_by_interest
    group(:level_of_interest).order(level_of_interest: :desc).count
  end

  def self.locations_and_jobs
    group(:city).order(:city).count
  end

end
