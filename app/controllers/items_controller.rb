class ItemsController < InheritedResources::Base
  before_filter :authorize_admin, :except => [:index, :show]
end
