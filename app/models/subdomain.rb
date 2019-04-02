class Subdomain < ApplicationRecord
  belongs_to :user
  validates :subdomain, 
            exclusion: { in: %w(www), 
            message: "%{value} is reserved." }, 
            presence: true, 
            uniqueness: true
  before_validation :sanitize_subdomain
  private

  def sanitize_subdomain
    self.subdomain = self.subdomain.parameterize
  end
end
