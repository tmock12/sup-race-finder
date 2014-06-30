class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  authem_for :user

  private

  def deny_user_access
    redirect_to :sign_in
  end
end
