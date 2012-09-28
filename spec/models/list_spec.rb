require 'spec_helper'

describe List do
  context "When selecting public lists" do
    it "not show lists created by current user" do
      current_user = User.create! :email => "joe@joe.com", :password => "123456"
      visitor      = User.create! :email => "visit@or.us", :password => "123456"

      public_list  = visitor.lists.create! :title => "Public", :public => true

      visitor.lists.create! :title => "Private"
      current_user.lists.create! :title => "Public and mine", :public => true
      current_user.lists.create! :title => "Private and mine"

      lists = List.public_for current_user
      lists.should have(1).list
      lists.first.should == public_list
    end
  end
end
