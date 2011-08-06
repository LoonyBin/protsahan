class ItemsController < InheritedResources::Base
  before_filter :authorize, :except => [:index, :show]
end
