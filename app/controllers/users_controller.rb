class UsersController < InheritedResources::Base
  before_filter :authenticate, :except => [:index, :show]
end
