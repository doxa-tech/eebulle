class AddConfirmationToNewsletterMails < ActiveRecord::Migration
  def change
    add_column :newsletter_emails, :confirmed, :boolean, default: false
    NewsletterEmail.update_all(confirmed: true)
  end
end
