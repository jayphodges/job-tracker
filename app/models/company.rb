class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :comments
  has_many :contacts
  has_many :jobs

  def self.top_three_by_interest
    Company.all.sort_by do |company|
      company.jobs.average(:level_of_interest)
    end.last(3).reverse
  end

  def average_interest
    total_interest = jobs.reduce(0) { |memo, job| memo + job.level_of_interest }
    average_level_of_interest = total_interest / jobs.count
    average_level_of_interest.round(2)
  end

end
