class NewsMailer < ActionMailer::Base
  default from: "\"Église évangélique de Bulle\" <newsletter@eebulle.ch>"

  def confirmation(email)
    @email = email
    mail(to: email, subject: "Confirmation pour la newsletter EEBulle")
  end

  def news(newsletter, email)
    @newsletter = newsletter
    @email = email
    headers['List-Unsubscribe'] = unsubscribe_url(Subscriber.unsubscribe_token(@email))
  	mail(to: email, subject: newsletter.subject)
  end

end
