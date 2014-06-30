class User < ActiveRecord::Base
  include Authem::User
  before_save :generate_api_token, on: :create
  alias_attribute :password_reset_token, :reset_password_token

  private

  def generate_api_token
    self.api_token = SecureRandom.hex.upcase
  end
end
