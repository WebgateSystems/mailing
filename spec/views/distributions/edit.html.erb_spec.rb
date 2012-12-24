require 'spec_helper'

describe "distributions/edit" do
  before(:each) do
    @distribution = assign(:distribution, stub_model(Distribution,
      :title => "MyString",
      :status_id => 1
    ))
  end

  it "renders the edit distribution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => distributions_path(@distribution), :method => "post" do
      assert_select "input#distribution_title", :name => "distribution[title]"
      assert_select "input#distribution_status_id", :name => "distribution[status_id]"
    end
  end
end
