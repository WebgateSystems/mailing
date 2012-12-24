require 'spec_helper'

describe "distributions/show" do
  before(:each) do
    @distribution = assign(:distribution, stub_model(Distribution,
      :title => "Title",
      :status_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
  end
end
