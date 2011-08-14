class OrdersController < InheritedResources::Base
  before_filter :authorize
  before_filter :authorize_admin, :only => [:edit, :update, :destroy]

protected
  def begin_of_association_chain
    current_user unless current_user.is_admin?
  end
end
