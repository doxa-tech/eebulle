class NewsMailer < ActionMailer::Base
  default from: "\"David de l'EEBulle\" <david.hausmann@eebulle.ch>"
  #
  # To overwrite, absolutely need to reset them to nil !
  #
  default 'X-MC-AutoText' => 1
	default 'X-MC-InlineCSS'=> "true"

  def news(content, subject, emails)
  	@content = content
  	mail(
  		to:  emails,
  		subject: subject
  	)
  end

end
