require 'spec_helper'

describe "comics/index" do
  before(:each) do
    assign(:comics, [
      stub_model(Comic,
        :image => "Image"
      ),
      stub_model(Comic,
        :image => "Image"
      )
    ])
  end

  it "renders a list of comics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
