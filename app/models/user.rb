class User < ActiveRecord::Base
  has_many :orders

  include Clearance::User
  has_paper_trail

  def is_admin?
    role == 'admin'
  end
end
