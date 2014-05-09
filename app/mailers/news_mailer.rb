class NewsMailer < ActionMailer::Base
  default from: "\"David de l'EEBulle\" <david.hausmann@eebulle.ch>"
  default 'X-MC-AutoText' => 1
	default 'X-MC-InlineCSS'=> "true"
  default 'X-MC-Track' => "clicks_all"

  def news(content)
  	@content = content
  	mail(
  		to: "nkcr.je@gmail.com", 
  		subject: 'Nouvelles activités',
  	)
  end

end
