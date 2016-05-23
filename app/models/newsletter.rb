class Newsletter < ActiveRecord::Base
  belongs_to :user

  validates :subject, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def inlined_css
    mailer = Premailer::Rails::Hook.new(NewsMailer.stub_news(self))
    mailer.perform
    mailer.message.html_part.body.decoded
  end

  def inline_css
    update_attribute(:content, inlined_css)
  end
end
