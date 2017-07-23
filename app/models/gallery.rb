class Gallery < ApplicationRecord
	has_many :paintings

	validates :name, presence: true, length: { maximum: 80 }
	validates :description, presence: true
	validates :date, presence: true
end
