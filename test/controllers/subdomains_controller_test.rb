require 'test_helper'

class SubdomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subdomain = subdomains(:one)
  end

  test "should get index" do
    get subdomains_url
    assert_response :success
  end

  test "should get new" do
    get new_subdomain_url
    assert_response :success
  end

  test "should create subdomain" do
    assert_difference('Subdomain.count') do
      post subdomains_url, params: { subdomain: { name: @subdomain.name, subdomain: @subdomain.subdomain, user_id: @subdomain.user_id } }
    end

    assert_redirected_to subdomain_url(Subdomain.last)
  end

  test "should show subdomain" do
    get subdomain_url(@subdomain)
    assert_response :success
  end

  test "should get edit" do
    get edit_subdomain_url(@subdomain)
    assert_response :success
  end

  test "should update subdomain" do
    patch subdomain_url(@subdomain), params: { subdomain: { name: @subdomain.name, subdomain: @subdomain.subdomain, user_id: @subdomain.user_id } }
    assert_redirected_to subdomain_url(@subdomain)
  end

  test "should destroy subdomain" do
    assert_difference('Subdomain.count', -1) do
      delete subdomain_url(@subdomain)
    end

    assert_redirected_to subdomains_url
  end
end
