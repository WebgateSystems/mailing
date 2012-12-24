require 'spec_helper'

describe "distributions/new" do
  before(:each) do
    assign(:distribution, stub_model(Distribution,
      :title => "MyString",
      :status_id => 1
    ).as_new_record)
  end

  it "renders new distribution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => distributions_path, :method => "post" do
      assert_select "input#distribution_title", :name => "distribution[title]"
      assert_select "input#distribution_status_id", :name => "distribution[status_id]"
    end
  end
end
