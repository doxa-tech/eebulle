class NewsletterEmail < ApplicationRecord
	include Rails.application.routes.url_helpers

	validates :email, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }, uniqueness: true

	def email_infos
		{
			"unsubscribe_url": unsubscribe_url(Subscriber.unsubscribe_token(self.email)),
		}
	end

	def confirmation_resendable
		self.updated_at < 1.hour.ago
	end
end
