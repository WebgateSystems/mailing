require 'spec_helper'

describe "letters/index" do
  before(:each) do
    assign(:letters, [
      stub_model(Letter,
        :body => "MyText",
        :lang => "Lang",
        :inline_image => "Inline Image"
      ),
      stub_model(Letter,
        :body => "MyText",
        :lang => "Lang",
        :inline_image => "Inline Image"
      )
    ])
  end

  it "renders a list of letters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Lang".to_s, :count => 2
    assert_select "tr>td", :text => "Inline Image".to_s, :count => 2
  end
end
