require 'spec_helper'

describe Task do
  context "When all tasks are completed" do
    it "mark list as done" do
      list = FactoryGirl.create(:list)
      task = FactoryGirl.create(:task, :list => list)
      list.done?.should be_false
      task.done?.should be_false
      task.toggle! :done
      list.done?.should be_true
      task.done?.should be_true
    end
  end

  context "When tasks are updated" do
    it "undone list if not all tasks completed" do
      list = FactoryGirl.create(:list, :done => true)
      task = FactoryGirl.create(:task, :list => list, :done => true)
      list.done?.should be_true
      task.done?.should be_true
      task.toggle! :done
      list.reload.done?.should be_false
    end
  end
end
