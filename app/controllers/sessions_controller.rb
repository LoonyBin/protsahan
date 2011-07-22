class SessionsController < ApplicationController
  def new
    session[:redirected_from] ||= request.env["HTTP_REFERER"]
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to session.delete(:redirected_from), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back, :notice => "Logged out!"
  end
end
