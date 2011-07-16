require 'spec_helper'

describe "items/index.html.haml" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :name => "Name",
        :description => "MyText",
        :image => "Image",
        :price => "9.99"
      ),
      stub_model(Item,
        :name => "Name",
        :description => "MyText",
        :image => "Image",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
