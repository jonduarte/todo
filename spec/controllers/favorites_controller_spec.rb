require 'spec_helper'

describe FavoritesController do
  login_user

  describe "PUT update" do
    it "redirect to public lists if list is not public" do
      visitor = FactoryGirl.create(:user)
      list = visitor.lists.create! :title => "Private list"

      put :update, { :id => list.id }
      response.should redirect_to(public_lists_path)
    end

    it "add list to favorites" do
      visitor = FactoryGirl.create(:user)
      list = visitor.lists.create! :title => "Public list", :public => true

      put :update, { :id => list.id }
      response.should redirect_to(favorites_path)
    end
  end
end
