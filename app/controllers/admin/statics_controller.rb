class Admin::StaticsController < Admin::BaseController
  before_action { |c| c.authorize_level(3) }

  def files
  end

end
