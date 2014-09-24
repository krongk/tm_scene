require 'test_helper'

class SiteImagesControllerTest < ActionController::TestCase
  setup do
    @site_image = site_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_image" do
    assert_difference('SiteImage.count') do
      post :create, site_image: { image: @site_image.image, image_content_type: @site_image.image_content_type, image_file_name: @site_image.image_file_name, image_file_size: @site_image.image_file_size, key: @site_image.key, name: @site_image.name, site_id: @site_image.site_id, site_section_id: @site_image.site_section_id }
    end

    assert_redirected_to site_image_path(assigns(:site_image))
  end

  test "should show site_image" do
    get :show, id: @site_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_image
    assert_response :success
  end

  test "should update site_image" do
    patch :update, id: @site_image, site_image: { image: @site_image.image, image_content_type: @site_image.image_content_type, image_file_name: @site_image.image_file_name, image_file_size: @site_image.image_file_size, key: @site_image.key, name: @site_image.name, site_id: @site_image.site_id, site_section_id: @site_image.site_section_id }
    assert_redirected_to site_image_path(assigns(:site_image))
  end

  test "should destroy site_image" do
    assert_difference('SiteImage.count', -1) do
      delete :destroy, id: @site_image
    end

    assert_redirected_to site_images_path
  end
end
