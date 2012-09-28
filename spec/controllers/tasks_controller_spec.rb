require 'spec_helper'

describe TasksController do
  login_user

  def valid_attributes
    { :title => "My Task" }
  end

  describe "POST create" do
    before do
      @list = FactoryGirl.create(:list)
    end

    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, { :list_id => @list.id, :task => valid_attributes}
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, { :list_id => @list.id, :task => valid_attributes}
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, { :list_id => @list.id, :task => valid_attributes}
        response.should redirect_to(@list)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        Task.any_instance.stub(:save).and_return(false)
        post :create, { :list_id => @list.id, :task => {}}
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        Task.any_instance.stub(:save).and_return(false)
        Task.any_instance.stub(:errors).and_return(["can't be blank"])
        post :create, { :list_id => @list.id, :task => {}}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @list = FactoryGirl.create(:list)
      @task = FactoryGirl.create(:task)
    end

    it "destroys the requested task" do
      expect {
        delete :destroy, { :list_id => @list.id, :id => @task.to_param}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, { :list_id => @list.id, :id => @task.to_param}
      response.should redirect_to(@list)
    end
  end
end
