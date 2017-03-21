require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  context "associations" do
    should belong_to :gallery
    should belong_to :user
  end

  test 'photo.next' do
    user = FactoryGirl.create(:user)
    gallery1 = FactoryGirl.create(:gallery, user: user)
    gallery2 = FactoryGirl.create(:gallery, user: user)
    photo1 = FactoryGirl.create(:photo, gallery: gallery1, created_at: 1)
    photo2 = FactoryGirl.create(:photo, gallery: gallery1, created_at: 2)
    photo3 = FactoryGirl.create(:photo, gallery: gallery2, created_at: 3)
    photo4 = FactoryGirl.create(:photo, gallery: gallery2, created_at: 4)
    assert_equal photo1, photo2.next
    assert_equal photo3, photo4.next
    refute_equal photo2, photo3.next
    refute photo3.next
  end

  test 'photo.previous' do
    user = FactoryGirl.create(:user)
    gallery1 = FactoryGirl.create(:gallery, user: user)
    gallery2 = FactoryGirl.create(:gallery, user: user)
    photo1 = FactoryGirl.create(:photo, gallery: gallery1, created_at: 1)
    photo2 = FactoryGirl.create(:photo, gallery: gallery1, created_at: 3)
    photo3 = FactoryGirl.create(:photo, gallery: gallery2, created_at: 2)
    photo4 = FactoryGirl.create(:photo, gallery: gallery2, created_at: 4)
    assert_equal photo2, photo1.previous
    assert_equal photo4, photo3.previous
    refute_equal photo3, photo2.previous
    refute photo2.previous
  end

end
