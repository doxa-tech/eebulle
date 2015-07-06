class NewslettersController < ApplicationController

  def show
    @newsletter = Newsletter.find(params[:id])
    render "news_mailer/news", layout: false
  end
end