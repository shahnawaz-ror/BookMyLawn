class WelcomeController < ApplicationController
  # skip_before_action :ensure_subdomain

  def index
    @subdomains = Subdomain.all
  end
  def contact_us
  	
  end
  def about_us
  	
  end
  def gallery
  	
  end
end
