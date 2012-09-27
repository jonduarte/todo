module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create! :email => "joe@joe.com", :password => "secr3t"
      sign_in user
    end
  end
end
