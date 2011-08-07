class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
private
  def authorize_admin
    deny_access("Don't bite more than you can chew!") unless signed_in? && current_user.is_admin?
  end
end
