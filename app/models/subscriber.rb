class Subscriber

  # Confirmation
  def self.confirmation_token(email)
    self.verifier(:secret_key_subscribe).generate(email)
  end

  def self.read_confirmation_token(signature)
    email = verifier(:secret_key_subscribe).verify(signature)
    NewsletterEmail.find_by_email(email)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  # Unsubscribe
  def self.unsubscribe_token(email)
    self.verifier(:secret_key_unsubscribe).generate(email)
  end

  def self.read_unsubscribe_token(signature)
    email = verifier(:secret_key_unsubscribe).verify(signature)
    NewsletterEmail.find_by_email(email)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  private

  def self.verifier(key_type)
    ActiveSupport::MessageVerifier.new(Rails.application.secrets[key_type])
  end

end
