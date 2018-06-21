class Admin::StaticsController < Admin::BaseController
  layout 'application'
  before_action :authenticate,  only: [:worship]

  def leaders
    redirect_to "https://bullenetwork.sharepoint.com/sites/home/eebulle/SitePages/Église-évangélique-de-Bulle.aspx"
  end

  def worship
    redirect_to Rails.application.credentials.worship_storage_url
  end

end
