require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = FactoryGirl.create(:user, password: "guest")
    @gallery = FactoryGirl.create(:gallery, user: @user)
  end

  test 'photos#create' do
    create_login(@user)
    post gallery_photos_path(@gallery.id),
      params: {
        photo: {
          title: "title",
          description: "desc"
        }
      }
    assert response.redirect?
    assert_equal 1, @gallery.photos.count
  end

  test 'photos#create authentication' do
    post gallery_photos_path(@gallery.id),
      params: {
        photo: {
          title: "title"
        }
      }
    follow_redirect!
    assert_equal login_path, path
    assert_equal "You must be logged in to do that.", flash[:warning]
  end

  test 'photos#destroy' do
    create_login(@user)
    5.times do
      FactoryGirl.create(:photo, gallery: @gallery)
    end
    total = @gallery.photos.count
    delete gallery_photo_path(@gallery.id, @gallery.photos.first)
    assert response.redirect?
    assert_equal (total - 1), @gallery.photos.count
  end

end
