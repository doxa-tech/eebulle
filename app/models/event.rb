class Event < ApplicationRecord

	validates :name, presence: true, length: { maximum: 80 }
	validates :content, presence: true
	validates :date, presence: true
	validates :duration, presence: true, numericality: true
	validates :image, presence: true

	has_one_attached :image

	def exp_at
		date + duration.days
	end
end
