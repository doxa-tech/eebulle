class NewsMailer < ActionMailer::Base
  default from: "\"David de l'eebulle\" <david.hausmann@eebulle.ch>"
  default 'X-MC-AutoText' => 1
	default 'X-MC-InlineCSS'=> "true"

  def news
  	mail(
  		to: "nkcr.je@gmail.com", 
  		subject: 'Welcome to My Awesome Site'
  	)
  end

end
