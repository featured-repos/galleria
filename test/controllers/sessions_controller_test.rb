require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test 'sessions#create' do
    user = FactoryGirl.create(:user, password: "guest")
    post login_path,
      params: {
        session: {
          username: user.username,
          password: "guest"
        }
      }
    assert session[:user_id] == user.id
  end

end
