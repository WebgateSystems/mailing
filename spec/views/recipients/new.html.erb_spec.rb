require 'spec_helper'

describe "recipients/new" do
  before(:each) do
    assign(:recipient, stub_model(Recipient,
      :email => "MyString",
      :lang => "MyString",
      :gender => "MyString",
      :salutation => "MyString",
      :name => "MyString",
      :patronymic => "MyString",
      :surname => "MyString"
    ).as_new_record)
  end

  it "renders new recipient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipients_path, :method => "post" do
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
