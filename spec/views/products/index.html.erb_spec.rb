require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title1",
        :description => "MyText",
        :image_url => "ImageUrl.png",
        :price => "9.99"
      ),
      stub_model(Product,
        :title => "Title2",
        :description => "MyText",
        :image_url => "ImageUrl.gif",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td>img[src=/assets/ImageUrl.png]", :count => 1
    assert_select "tr>td>img[src=/assets/ImageUrl.gif]", :count => 1
    assert_select "tr>td.list_description>dl>dt", :text => %r{Title}, :count => 2
    assert_select "tr>td.list_description>dl>dd", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
