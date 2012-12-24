require 'spec_helper'

describe "recipients/index" do
  before(:each) do
    assign(:recipients, [
      stub_model(Recipient,
        :email => "Email",
        :lang => "Lang",
        :gender => "Gender",
        :salutation => "Salutation",
        :name => "Name",
        :patronymic => "Patronymic",
        :surname => "Surname"
      ),
      stub_model(Recipient,
        :email => "Email",
        :lang => "Lang",
        :gender => "Gender",
        :salutation => "Salutation",
        :name => "Name",
        :patronymic => "Patronymic",
        :surname => "Surname"
      )
    ])
  end

  it "renders a list of recipients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Lang".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Salutation".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Patronymic".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
  end
end
