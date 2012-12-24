require 'spec_helper'

describe "letters/edit" do
  before(:each) do
    @letter = assign(:letter, stub_model(Letter,
      :body => "MyText",
      :lang => "MyString",
      :inline_image => "MyString"
    ))
  end

  it "renders the edit letter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => letters_path(@letter), :method => "post" do
      assert_select "textarea#letter_body", :name => "letter[body]"
      assert_select "input#letter_lang", :name => "letter[lang]"
      assert_select "input#letter_inline_image", :name => "letter[inline_image]"
    end
  end
end
