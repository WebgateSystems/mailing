require 'spec_helper'

describe "letters/show" do
  before(:each) do
    @letter = assign(:letter, stub_model(Letter,
      :body => "MyText",
      :lang => "Lang",
      :inline_image => "Inline Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Lang/)
    rendered.should match(/Inline Image/)
  end
end
