class Newsletter < ActiveRecord::Base
  belongs_to :user

  validates :subject, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
