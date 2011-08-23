class OrdersController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :item, :optional => true
  def create
    create! {orders_url}
  end
protected
  def create_resource(object)
    object.user = current_user
    object.save
  end
end
