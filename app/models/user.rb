class User < ActiveRecord::Base
  include Authem::User
  before_save :generate_api_token, on: :create

  private

  def generate_api_token
    self.api_token = SecureRandom.hex.upcase
  end
end
