# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = Rails.application.credentials.mailgun_api_key
  config.domain  = 'mailgun.eebulle.ch'
end
::MailgunList = Mailgun().list_members(Rails.application.credentials.mailgun_mailing_list)
