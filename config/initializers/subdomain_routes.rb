class SubdomainRoutes
  def self.matches? request
    case request.subdomain
    when ''
      true
    else
      false
    end
  end
end