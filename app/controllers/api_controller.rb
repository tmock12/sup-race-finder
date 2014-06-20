class ApiController < ActionController::Base
  before_filter :require_api_user

  expose(:api_user) do
    authenticate_with_http_token { |token| User.find_by_api_token(token) }
  end

  protected

  def require_api_user
    render json: {error: 'Invalid User'}, status: :unauthorized unless api_user.present?
  end
end
