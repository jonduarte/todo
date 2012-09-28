require 'spec_helper'

describe "lists/index" do
  before(:each) do
    assign(:lists, [
      stub_model(List,
        :title => "My List",
        :done => false,
        :public => false
      ),
      stub_model(List,
        :title => "My List",
        :done => true,
        :public => false
      )
    ])
  end

  it "renders a list of lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "My List".to_s, :count => 2
  end
end
