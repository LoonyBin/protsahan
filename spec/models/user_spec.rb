require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  subject { user }

  it "should be audited" do
    with_versioning { should have_many :versions}
  end

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value("test@domain.tld").for(:email) }
  it { should allow_value("test+label@domain.tld").for(:email) }
  it { should allow_value("test.next@domain.tld").for(:email) }
  it { should_not allow_value("testdomain.tld").for(:email) }
  it { should_not allow_value("test@domain").for(:email) }
  it { should_not allow_value("testdomain").for(:email) }

  it "should require password only upon creation" do
    should_not validate_presence_of(:password)
    build(:user).should validate_presence_of(:password)
  end

  context "admin" do
    let(:user) { create(:user, :role => 'admin') }
    subject {user}

    its(:is_admin?) { should be_true }
  end
end
