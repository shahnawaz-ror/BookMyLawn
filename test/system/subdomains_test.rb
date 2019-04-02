require "application_system_test_case"

class SubdomainsTest < ApplicationSystemTestCase
  setup do
    @subdomain = subdomains(:one)
  end

  test "visiting the index" do
    visit subdomains_url
    assert_selector "h1", text: "Subdomains"
  end

  test "creating a Subdomain" do
    visit subdomains_url
    click_on "New Subdomain"

    fill_in "Name", with: @subdomain.name
    fill_in "Subdomain", with: @subdomain.subdomain
    fill_in "User", with: @subdomain.user_id
    click_on "Create Subdomain"

    assert_text "Subdomain was successfully created"
    click_on "Back"
  end

  test "updating a Subdomain" do
    visit subdomains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @subdomain.name
    fill_in "Subdomain", with: @subdomain.subdomain
    fill_in "User", with: @subdomain.user_id
    click_on "Update Subdomain"

    assert_text "Subdomain was successfully updated"
    click_on "Back"
  end

  test "destroying a Subdomain" do
    visit subdomains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subdomain was successfully destroyed"
  end
end
