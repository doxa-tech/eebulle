class NewsletterEmailsController < ApplicationController

	def new
		@newsletter_email = NewsletterEmail.new
	end

	def create
		@newsletter_email = NewsletterEmail.new(newsletter_email_params)
		if @newsletter_email.save
			NewsMailer.confirmation(newsletter_email_params[:email]).deliver_now
			redirect_to root_path, success: t('newsletter_email.new.success')
		elsif @newsletter_email.errors.added? :email, :taken
			record = NewsletterEmail.where(newsletter_email_params).first
			if record.confirmed
				redirect_to root_path, notice: t('newsletter_email.new.exists')
			else
				# this prevents a mass email atttack to a single address
				if record.confirmation_resendable
					NewsMailer.confirmation(newsletter_email_params[:email]).deliver_now
					record.touch
					redirect_to root_path, notice: t('newsletter_email.new.resend')
				else
					redirect_to root_path, notice: t('newsletter_email.new.no_resend')
				end
			end
		else
			render 'new'
		end
	end

	def confirmation
		newsletter_email = Subscriber.read_confirmation_token(params[:signature])
		if newsletter_email.nil?
			redirect_to root_path, error: t('newsletter_email.confirmation.error')
		elsif newsletter_email.confirmed
			redirect_to root_path, error: t('newsletter_email.confirmation.already')
		elsif newsletter_email.update_attributes(confirmed: true)
			# add to mailgun email list
			MailgunList.add(newsletter_email.email)
		else
			redirect_to root_path, error: t('newsletter_email.confirmation.error')
		end
	end

	def unsubscribe
		newsletter_email = Subscriber.read_unsubscribe_token(params[:signature])
		if newsletter_email.nil?
			redirect_to root_path, error: t('newsletter_email.unsubscribe.error')
		else
			newsletter_email.destroy
			MailgunList.remove(newsletter_email.email) if newsletter_email.confirmed
		end
	end

	private

	def newsletter_email_params
		params.require(:newsletter_email).permit(:email)
	end

end
