class Admin::NewslettersController < Admin::BaseController
  before_action { |c| c.authorize_level(2) }

  def index
    @table = Table.new(self, Newsletter, nil, { search: true })
    @table.respond
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.user = current_user
    if params[:commit] == "Envoyer" && @newsletter.save
      newsletter_emails = NewsletterEmail.where(confirmed: true)
      emails_params = Hash.new
      newsletter_emails.each { |email| emails_params[email.email] = email.email_infos }
      send_mailgun_newsletter(Rails.application.credentials.mailgun_mailing_list, emails_params)
      @newsletter.update_inline_css
      render 'success'
    elsif params[:commit] == "Tester" && @newsletter.valid?
      @newsletter.id = 1
      send_mailgun_newsletter(params[:email])
      render 'test'
    else
      render 'error'
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:subject, :title, :subtitle, :content)
  end

  def send_mailgun_newsletter(to, emails_params = {})
    Mailgun().messages.send_email({
      to:      to,
      subject: @newsletter.subject,
      html:    @newsletter.inlined_css,
      from:    "newsletter@eebulle.ch",
      "recipient-variables": emails_params.to_json
    })
  end
end
