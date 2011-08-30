class Item < ActiveRecord::Base
  attr_accessible :name, :description, :image, :remote_image_url, :price
  has_many :orders, :dependent => :destroy

  has_paper_trail
  mount_uploader :image, ItemImageUploader

  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true,
                    :numericality => { :greater_than_or_equal_to => 0 }
end
