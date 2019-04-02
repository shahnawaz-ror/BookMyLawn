class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
  before_action :ensure_subdomain

  def current_domain
    @current_domain ||= Subdomain.find_by(subdomain: request.subdomain)
  end
  helper_method :current_domain

  private

  def ensure_subdomain
    redirect_to root_url(subdomain: :www) unless current_domain.present?
  end
end
