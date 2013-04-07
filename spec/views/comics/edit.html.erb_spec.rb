require 'spec_helper'

describe "comics/edit" do
  before(:each) do
    @comic = assign(:comic, stub_model(Comic,
      :image => "MyString"
    ))
  end

  it "renders the edit comic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comics_path(@comic), :method => "post" do
      assert_select "input#comic_image", :name => "comic[image]"
    end
  end
end
