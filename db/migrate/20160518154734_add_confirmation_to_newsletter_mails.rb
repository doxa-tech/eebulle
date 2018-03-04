class AddConfirmationToNewsletterMails < ActiveRecord::Migration[4.2]
  def change
    add_column :newsletter_emails, :confirmed, :boolean, default: false
    NewsletterEmail.update_all(confirmed: true)
  end
end
