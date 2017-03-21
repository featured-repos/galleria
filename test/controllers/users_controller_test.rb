require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test 'users#create' do
    users = User.all.count
    post users_path,
      params: {
        user: {
          username: "test",
          password: "guest",
          email: "tester@example.com",
        }
      }
    total = User.all.count
    assert_equal (users + 1), total
    assert_equal "test", User.last.username
  end

end
