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
      emails = NewsletterEmail.where(confirmed: true).pluck(:email)
      emails.each{|email| NewsMailer.news(@newsletter, email).deliver_now}
      render 'success'
    elsif params[:commit] == "Tester" && @newsletter.valid?
      @newsletter.id = 1
      NewsMailer.news(@newsletter, params[:email]).deliver_now
      render 'test'
    else
      render 'error'
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:subject, :title, :subtile, :content)
  end
end
