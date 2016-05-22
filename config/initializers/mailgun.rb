# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = Rails.application.secrets.mailgun_api_key
  config.domain  = 'eebulle.ch'
end
::MailgunList = Mailgun().list_members(Rails.application.secrets.mailgun_mailing_list)
