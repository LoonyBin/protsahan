class User < ActiveRecord::Base
  include Clearance::User
  has_paper_trail
end
