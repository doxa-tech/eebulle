class Admin::NewsletterEmailsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, NewsletterEmail)
		@table.respond
	end

	def new
		@newsletter_email = NewsletterEmail.new
	end

	def create
		@newsletter_email = NewsletterEmail.new(newsletter_email_params)
		if @newsletter_email.save
			MailgunList.add(@newsletter_email.email) if @newsletter_email.confirmed
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
		@newsletter_email.assign_attributes(newsletter_email_params)
		if @newsletter_email.valid?
			MailgunList.add(@newsletter_email.email)    if @newsletter_email.confirmed_changed? &&  @newsletter_email.confirmed
			MailgunList.remove(@newsletter_email.email) if @newsletter_email.confirmed_changed? && !@newsletter_email.confirmed
			@newsletter_email.save
			redirect_to admin_newsletter_emails_path, success: t('newsletter_email.admin.edit.success')
		else
			render 'edit'
		end
	end

	def destroy
		@newsletter_email = NewsletterEmail.find(params[:id])
		MailgunList.remove(@newsletter_email.email)
		@newsletter_email.destroy
		redirect_to admin_newsletter_emails_path, success: t('newsletter_email.admin.destroy.success')
	end

	private

	def newsletter_email_params
		params.require(:newsletter_email).permit(:email, :confirmed)
	end

end
