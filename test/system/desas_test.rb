require "application_system_test_case"

class DesasTest < ApplicationSystemTestCase
  setup do
    @desa = desas(:one)
  end

  test "visiting the index" do
    visit desas_url
    assert_selector "h1", text: "Desas"
  end

  test "creating a Desa" do
    visit desas_url
    click_on "New Desa"

    fill_in "Name", with: @desa.name
    click_on "Create Desa"

    assert_text "Desa was successfully created"
    click_on "Back"
  end

  test "updating a Desa" do
    visit desas_url
    click_on "Edit", match: :first

    fill_in "Name", with: @desa.name
    click_on "Update Desa"

    assert_text "Desa was successfully updated"
    click_on "Back"
  end

  test "destroying a Desa" do
    visit desas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Desa was successfully destroyed"
  end
end
