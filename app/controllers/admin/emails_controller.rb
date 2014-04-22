class Admin::EmailsController < Admin::BaseController

	def new
	end

	def create
		# Mailer params[:content]
		redirect_to admin_newsletter_emails_path, success: t('email.admin.new.success')
	end
end
