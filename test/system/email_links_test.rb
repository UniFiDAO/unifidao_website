require "application_system_test_case"

class EmailLinksTest < ApplicationSystemTestCase
  setup do
    @email_link = email_links(:one)
  end

  test "visiting the index" do
    visit email_links_url
    assert_selector "h1", text: "Email Links"
  end

  test "creating a Email link" do
    visit email_links_url
    click_on "New Email Link"

    fill_in "Expires at", with: @email_link.expires_at
    fill_in "Token", with: @email_link.token
    fill_in "User", with: @email_link.user_id
    click_on "Create Email link"

    assert_text "Email link was successfully created"
    click_on "Back"
  end

  test "updating a Email link" do
    visit email_links_url
    click_on "Edit", match: :first

    fill_in "Expires at", with: @email_link.expires_at
    fill_in "Token", with: @email_link.token
    fill_in "User", with: @email_link.user_id
    click_on "Update Email link"

    assert_text "Email link was successfully updated"
    click_on "Back"
  end

  test "destroying a Email link" do
    visit email_links_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Email link was successfully destroyed"
  end
end
