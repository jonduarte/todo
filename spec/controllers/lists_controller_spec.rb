require 'spec_helper'

describe ListsController do
  login_user

  def valid_attributes
    { :title => "My List" }
  end

  describe "GET index" do
    it "assigns all lists as @lists" do
      list = subject.current_user.lists.create! valid_attributes
      get :index, {}
      assigns(:lists).should eq([list])
    end
  end

  describe "GET public" do
    it "show available lists" do
      visitor = FactoryGirl.create(:user)
      list = visitor.lists.create! valid_attributes.merge(:public => true)

      get :public, {}
      assigns(:lists).should eq([list])
    end
  end

  describe "GET show" do
    it "assigns the requested list as @list" do
      list = FactoryGirl.create(:list, valid_attributes)
      get :show, {:id => list.to_param}
      assigns(:list).should eq(list)
    end
  end

  describe "GET new" do
    it "assigns a new list as @list" do
      get :new, {}
      assigns(:list).should be_a_new(List)
    end
  end

  describe "GET edit" do
    it "assigns the requested list as @list" do
      list = FactoryGirl.create(:list, valid_attributes)
      get :edit, {:id => list.to_param}
      assigns(:list).should eq(list)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new List" do
        expect {
          post :create, {:list => valid_attributes}
        }.to change(List, :count).by(1)
      end

      it "assigns a newly created list as @list" do
        post :create, {:list => valid_attributes}
        assigns(:list).should be_a(List)
        assigns(:list).should be_persisted
      end

      it "redirects to the created list" do
        post :create, {:list => valid_attributes}
        response.should redirect_to(List.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved list as @list" do
        List.any_instance.stub(:save).and_return(false)
        post :create, {:list => {}}
        assigns(:list).should be_a_new(List)
      end

      it "re-renders the 'new' template" do
        List.any_instance.stub(:save).and_return(false)
        List.any_instance.stub(:errors).and_return(["can't be blank"])
        post :create, {:list => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before do
      @list = FactoryGirl.create(:list, valid_attributes)
    end

    describe "with valid params" do
      it "updates the requested list" do
        List.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @list.to_param, :list => {'these' => 'params'}}
      end

      it "assigns the requested list as @list" do
        put :update, {:id => @list.to_param, :list => valid_attributes}
        assigns(:list).should eq(@list)
      end

      it "redirects to the list" do
        put :update, {:id => @list.to_param, :list => valid_attributes}
        response.should redirect_to(@list)
      end
    end

    describe "with invalid params" do
      it "assigns the list as @list" do
        List.any_instance.stub(:save).and_return(false)
        put :update, {:id => @list.to_param, :list => {}}
        assigns(:list).should eq(@list)
      end

      it "re-renders the 'edit' template" do
        List.any_instance.stub(:save).and_return(false)
        List.any_instance.stub(:errors).and_return(["can't be blank"])
        put :update, {:id => @list.to_param, :list => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @list = FactoryGirl.create(:list, valid_attributes)
    end

    it "destroys the requested list" do
      expect {
        delete :destroy, {:id => @list.to_param}
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists list" do
      delete :destroy, {:id => @list.to_param}
      response.should redirect_to(lists_url)
    end
  end
end
