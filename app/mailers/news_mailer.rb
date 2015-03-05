class NewsMailer < ActionMailer::Base
  default from: "\"Église évangélique de Bulle\" <newsletter@eebulle.ch>"
  #
  # To overwrite, absolutely need to reset them to nil !
  #
  default 'X-MC-AutoText' => 1
	default 'X-MC-InlineCSS'=> "true"

  def news(subject, title, subtitle, content, emails)
    @title = title
    @subtitle = subtitle
    @content = content
  	mail(
  		to:  emails,
  		subject: subject
  	)
  end

end
