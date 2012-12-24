require 'spec_helper'

describe "recipients/edit" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :email => "MyString",
      :lang => "MyString",
      :gender => "MyString",
      :salutation => "MyString",
      :name => "MyString",
      :patronymic => "MyString",
      :surname => "MyString"
    ))
  end

  it "renders the edit recipient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipients_path(@recipient), :method => "post" do
      assert_select "input#recipient_email", :name => "recipient[email]"
      assert_select "input#recipient_lang", :name => "recipient[lang]"
      assert_select "input#recipient_gender", :name => "recipient[gender]"
      assert_select "input#recipient_salutation", :name => "recipient[salutation]"
      assert_select "input#recipient_name", :name => "recipient[name]"
      assert_select "input#recipient_patronymic", :name => "recipient[patronymic]"
      assert_select "input#recipient_surname", :name => "recipient[surname]"
    end
  end
end
