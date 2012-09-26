require "spec_helper"

describe TasksController do
  describe "routing" do
    it "routes to #create" do
      post("lists/1/tasks").should route_to("tasks#create", :list_id => "1")
    end

    it "routes to #update" do
      put("lists/1/tasks/1").should route_to("tasks#update", :id => "1", :list_id => "1")
    end

    it "routes to #destroy" do
      delete("lists/1/tasks/1").should route_to("tasks#destroy", :id => "1", :list_id => "1")
    end

  end
end
