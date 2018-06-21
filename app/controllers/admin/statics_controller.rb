class Admin::StaticsController < Admin::BaseController
  layout 'application'
  before_action :authenticate

  def leaders
  end

  def worship
    redirect_to Rails.application.credentials.worship_storage_url
  end

end
