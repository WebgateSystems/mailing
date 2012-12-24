require 'spec_helper'

describe "recipients/show" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :email => "Email",
      :lang => "Lang",
      :gender => "Gender",
      :salutation => "Salutation",
      :name => "Name",
      :patronymic => "Patronymic",
      :surname => "Surname"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Lang/)
    rendered.should match(/Gender/)
    rendered.should match(/Salutation/)
    rendered.should match(/Name/)
    rendered.should match(/Patronymic/)
    rendered.should match(/Surname/)
  end
end
