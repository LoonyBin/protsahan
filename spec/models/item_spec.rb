require 'spec_helper'

describe Item do
  let(:item) { create(:item) }
  subject { item }

  it "should be audited" do
    with_versioning { should have_many :versions }
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price) }
  it { should have_many(:orders).dependent(:destroy) }
end
