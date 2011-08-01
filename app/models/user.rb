class User < ActiveRecord::Base
  attr_accessible :email, :password
  has_secure_password
  has_paper_trail
  validates_presence_of :password, :on => :create
  validates :email, :presence => true,
                    :uniqueness => true
end
