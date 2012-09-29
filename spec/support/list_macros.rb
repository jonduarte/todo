def list_for_current_user
  FactoryGirl.create(:list, valid_attributes.merge(:user => subject.current_user))
end
