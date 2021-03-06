class Activity < ApplicationRecord
	has_many :day_activities
	has_many :days, through: :day_activities
	belongs_to :recurrence

	validates :name, presence: true, length: { maximum: 80 }
	validates :content, presence: true
	validates :time, presence: true
	validates :recurrence_id, presence: true
	validates :image, presence: true

	has_one_attached :image
end
