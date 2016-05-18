class Subscriber

  def self.access_token(email)
    self.create_access_token(email)
  end

  def self.read_access_token(signature)
    email = verifier.verify(signature)
    NewsletterEmail.find_by_email(email)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  private

  def self.create_access_token(email)
    verifier.generate(email)
  end

  def self.verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  end

end
