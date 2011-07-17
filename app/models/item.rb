class Item < ActiveRecord::Base
  attr_accessible :name, :description, :image, :remote_image_url, :price

  has_paper_trail
  mount_uploader :image, ItemImageUploader
end
