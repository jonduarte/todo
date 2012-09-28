require 'spec_helper'

describe List do
  it "complete list if all tasks are done" do
    list = FactoryGirl.create(:list)
    task = FactoryGirl.create(:task, :list => list, :done => true)
    list.completed?.should be_true
  end

  context "When selecting public lists" do
    it "not show lists created by current user" do
      current_user = FactoryGirl.create(:user)
      visitor      = FactoryGirl.create(:user)

      public_list  = FactoryGirl.create(:list, :public => true, :user => visitor)

      FactoryGirl.create(:list, :user => visitor)
      FactoryGirl.create(:list, :user => current_user, :public => true)
      FactoryGirl.create(:list, :user => current_user)

      lists = List.public_for current_user
      lists.should have(1).list
      lists.first.should == public_list
    end
  end
end
