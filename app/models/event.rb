class Event < ActiveRecord::Base

	validates :name, presence: true, length: { maximum: 80 }
	validates :content, presence: true
	validates :date, presence: true
	validates :duration, presence: true, numericality: true
end
