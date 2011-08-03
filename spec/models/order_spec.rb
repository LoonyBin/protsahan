require 'spec_helper'

describe Order do
  let(:order) { create(:order) }
  subject { order }

  it "should be audited" do
    with_versioning { should have_many :versions}
  end

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :item_id }
  it {
    should validate_presence_of :quantity
    should validate_numericality_of :quantity
    should allow_value(10).for(:quantity)
    should_not allow_value(0).for(:quantity)
    should_not allow_value(-10).for(:quantity)
    should_not allow_value(9.9).for(:quantity)
  }
end
