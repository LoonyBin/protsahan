class User < ActiveRecord::Base
  include Clearance::User
  has_paper_trail

  def is_admin?
    role == 'admin'
  end
end
