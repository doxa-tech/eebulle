class Message < ApplicationRecord
  enum category: [:preaching, :homegroup, :teaching, :bible_study, :vip]

	validates :name, presence: true, length: { maximum: 80 }
	validates :speaker, presence: true, length: { maximum: 80 }
	validates :file, presence: true
	validates :date, presence: true

	has_one_attached :file
end
