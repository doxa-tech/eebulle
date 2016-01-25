class Message < ActiveRecord::Base
  enum category: [:preaching, :homegroup]

	validates :name, presence: true, length: { maximum: 80 }
	validates :speaker, presence: true, length: { maximum: 80 }
	validates :file, presence: true
	validates :date, presence: true

	mount_uploader :file, MessagesUploader
end
