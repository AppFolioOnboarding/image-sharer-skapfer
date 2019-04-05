class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    redirect_to imageurls_url, status: :temporary_redirect
  end
end
