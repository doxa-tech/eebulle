class NewsMailer < ActionMailer::Base
  default from: "\"Église évangélique de Bulle\" <newsletter@eebulle.ch>"
  #
  # To overwrite, absolutely need to reset them to nil !
  #
  default 'X-MC-AutoText' => 1
	default 'X-MC-InlineCSS'=> "true"

  def news(newsletter, emails)
    @newsletter = newsletter
  	mail(
      to:  emails,
  		subject: newsletter.subject
  	)
  end

end
