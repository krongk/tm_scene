require 'test_helper'

class SiteSectionsControllerTest < ActionController::TestCase
  setup do
    @site_section = site_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_section" do
    assert_difference('SiteSection.count') do
      post :create, site_section: { html: @site_section.html, position: @site_section.position, section_id: @site_section.section_id, site_id: @site_section.site_id }
    end

    assert_redirected_to site_section_path(assigns(:site_section))
  end

  test "should show site_section" do
    get :show, id: @site_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_section
    assert_response :success
  end

  test "should update site_section" do
    patch :update, id: @site_section, site_section: { html: @site_section.html, position: @site_section.position, section_id: @site_section.section_id, site_id: @site_section.site_id }
    assert_redirected_to site_section_path(assigns(:site_section))
  end

  test "should destroy site_section" do
    assert_difference('SiteSection.count', -1) do
      delete :destroy, id: @site_section
    end

    assert_redirected_to site_sections_path
  end
end
