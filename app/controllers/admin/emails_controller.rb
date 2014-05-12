class Admin::EmailsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }
	
	def new
	end

	def create
		# Mailer params[:content]
		NewsMailer.news(params[:content], params[:subject]).deliver
		redirect_to admin_newsletter_emails_path, success: t('email.admin.new.success')
	end
end
