require 'spec_helper'

describe "items/edit.html.haml" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :name => "MyString",
      :description => "MyText",
      :image => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_name", :name => "item[name]"
      assert_select "textarea#item_description", :name => "item[description]"
      assert_select "input#item_image", :name => "item[image]"
      assert_select "input#item_price", :name => "item[price]"
    end
  end
end
