class NewsMailer < ActionMailer::Base
  default from: "\"Église évangélique de Bulle\" <newsletter@eebulle.ch>"

  layout 'mailer'

  def confirmation(email)
    @email = email
    mail(to: email, subject: "Confirmation pour la newsletter EEBulle")
  end

  # This method fakes a mailer so as to get it's body
  def stub_news(newsletter)
    @newsletter = newsletter
  	mail(to: nil, subject: newsletter.subject)
  end

end
