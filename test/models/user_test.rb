require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should have_secure_password

  context "associations" do
    should have_many(:galleries)
    should have_many(:photos)
  end

  context "validations" do
    should validate_presence_of :username
    should validate_presence_of :password
    should validate_presence_of :email
  end

end
