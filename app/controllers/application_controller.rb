class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to sign_in_path and return unless current_user
    begin
      redirect_to :back, :alert => "Don't bite more than you can chew!"
    rescue ActionController::RedirectBackError
      redirect_to :root, :alert => "Don't bite more than you can chew!"
    end
  end
end
