class NewsletterEmailsController < ApplicationController

	def new
		@newsletter_email = NewsletterEmail.new
	end

	def create
		@newsletter_email = NewsletterEmail.new(newsletter_email_params)
		if @newsletter_email.save
			redirect_to root_path, success: t('newsletter_email.new.success')
		else
			render 'new'
		end
	end

	def unsubscribe
		newsletter_email = Subscriber.read_access_token(params[:signature])
		if !newsletter_email.nil?
			newsletter_email.destroy
			render 'success'
		else
			render 'error'
		end
	end

	private

	def newsletter_email_params
		params.require(:newsletter_email).permit(:email)
	end

end
