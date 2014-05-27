class SessionsController < ApplicationController
  expose(:user) { User.find_by(email: params[:email]) }

  def new
    redirect_to :root if current_user
  end

  def create
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to :root
    else
      flash.now[:sign_in_error] = "Your email or password are incorrect. Please try again."
      render :new
    end
  end

end
