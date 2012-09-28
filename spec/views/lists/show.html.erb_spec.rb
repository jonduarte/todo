require 'spec_helper'

describe "lists/show" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :title => "Title",
      :done => false,
      :public => false
    ))
    @task = assign :task, stub_model(Task)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/icon-eye-close/)
  end
end
