require 'spec_helper'

describe Item do
  before(:each) do
    @item = Factory.create(:item)
    subject { @item }
  end

  it "should be audited" do
    with_versioning { should have_many :versions}
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
