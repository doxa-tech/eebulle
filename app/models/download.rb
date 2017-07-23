class Download < ApplicationRecord

	validates :name, presence: true, length: {maximum: 100}
	validates :file, presence: true

	mount_uploader :file, DownloadsUploader

	before_save :update_file_attributes

  private

  def update_file_attributes
    if file.present? && file_changed?
      self.extension = file.file.extension.downcase
      self.size = file.size
    end
  end
end
