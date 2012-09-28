require 'spec_helper'

describe User do
  it "Add list as favorite" do
    user = FactoryGirl.create :user
    list = FactoryGirl.create :list

    user.favorites << list
    user.favorites.should eq([list])
  end
end
