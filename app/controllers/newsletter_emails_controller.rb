class NewsletterEmailsController < ApplicationController

	def new
		@newsletter_email = NewsletterEmail.new
	end

	def create
		@newsletter_email = NewsletterEmail.new(newsletter_email_params)
		if @newsletter_email.save
			NewsMailer.confirmation(newsletter_email_params[:email]).deliver_now
			redirect_to root_path, success: t('newsletter_email.new.success')
		else
			render 'new'
		end
	end

	def confirmation
		newsletter_email = Subscriber.read_confirmation_token(params[:signature])
		if newsletter_email.nil? || !newsletter_email.update_attributes(confirmed: true)
			redirect_to root_path, error: t('newsletter_email.confirmation.error')
		end
	end

	def unsubscribe
		newsletter_email = Subscriber.read_unsubscribe_token(params[:signature])
		if newsletter_email.nil?
			redirect_to root_path, error: t('newsletter_email.unsubscribe.error')
		else
			newsletter_email.destroy
		end
	end

	private

	def newsletter_email_params
		params.require(:newsletter_email).permit(:email)
	end

end
