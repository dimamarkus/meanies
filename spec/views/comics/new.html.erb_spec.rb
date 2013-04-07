require 'spec_helper'

describe "comics/new" do
  before(:each) do
    assign(:comic, stub_model(Comic,
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new comic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comics_path, :method => "post" do
      assert_select "input#comic_image", :name => "comic[image]"
    end
  end
end
