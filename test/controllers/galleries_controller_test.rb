require 'test_helper'

class GalleriesControllerTest < ActionDispatch::IntegrationTest

  test 'galleries#create' do
    user = create_login
    post galleries_path,
      params: {
        gallery: {
          title: "title"
        }
      }
    assert response.redirect?
    assert_equal 1, user.galleries.count
    assert_equal "title", user.galleries.first.title
  end

  test 'galleries#create authentication' do
    post galleries_path,
      params: {
        gallery: {
          title: "title"
        }
      }
    follow_redirect!
    assert_equal login_path, path
    assert_equal "You must be logged in to do that.", flash[:warning]
  end

  test 'galleries#update' do
    user = create_login
    post galleries_path,
      params: {
        gallery: {
          title: "title",
          description: "desc"
        }
      }
    assert_equal 1, user.galleries.count
    patch gallery_path(user.galleries.first),
      params: {
        gallery: {
          title: "different title"
        }
      }
    assert response.redirect?
    assert_equal 1, user.galleries.count
    assert_equal "different title", user.galleries.first.title
  end

  test 'galleries#update authentication' do
    gallery = FactoryGirl.create(:gallery)
    patch gallery_path(gallery),
      params: {
        gallery: {
          title: "new title"
        }
      }
    follow_redirect!
    assert_equal login_path, path
    assert_equal "You must be logged in to do that.", flash[:warning]
  end

  test 'galleries#destroy' do
    user = create_login
    5.times do
      FactoryGirl.create(:gallery, user: user)
    end
    assert_equal 5, user.galleries.count
    gallery_id = user.galleries.first.id
    delete gallery_path(user.galleries.first)
    refute Gallery.find_by(id: gallery_id)
    assert_equal 4, user.galleries.count
  end

  test 'galleries#destroy authentication' do
    gallery = FactoryGirl.create(:gallery)
    delete gallery_path(gallery)
    follow_redirect!
    assert_equal login_path, path
    assert_equal "You must be logged in to do that.", flash[:warning]
  end

end
