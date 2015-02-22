class Admin::EmailsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }
	
	def new
	end

	def create
    emails = (params[:commit] == "Envoyer" ? NewsletterEmail.pluck(:email) : params[:email])
		NewsMailer.news(params[:content], params[:subject], emails).deliver
	end
end
