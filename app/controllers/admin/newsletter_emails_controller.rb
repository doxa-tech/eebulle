class Admin::NewsletterEmailsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = NewsletterTable.new(view_context)
		respond_to do |format|
			format.html
			format.js { render 'sort' }
		end
	end

	def new
		@newsletter_email = NewsletterEmail.new
	end

	def create
		@newsletter_email = NewsletterEmail.new(newsletter_email_params)
		if @newsletter_email.save
			redirect_to admin_newsletter_emails_path, success: t('newsletter_email.admin.new.success')
		else
			render 'new'
		end
	end

	def edit
		@newsletter_email = NewsletterEmail.find(params[:id])
	end

	def update
		@newsletter_email = NewsletterEmail.find(params[:id])
		if @newsletter_email.update_attributes(newsletter_email_params)
			redirect_to admin_newsletter_emails_path, success: t('newsletter_email.admin.edit.success')
		else
			render 'edit'
		end
	end

	def destroy
		NewsletterEmail.find(params[:id]).destroy
		redirect_to admin_activities_path, success: t('newsletter_email.admin.destroy.success')
	end

	private

	def newsletter_email_params
		params.require(:newsletter_email).permit(:email)
	end
end
