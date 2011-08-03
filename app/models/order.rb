class Order < ActiveRecord::Base
  attr_accessible :user, :item, :quantity
  belongs_to :user
  belongs_to :item

  has_paper_trail

  validates :user_id, :presence => true
  validates :item_id, :presence => true
  validates :quantity,  :presence => true,
                        :numericality => { :greater_than => 0, :only_integer => true }
end
