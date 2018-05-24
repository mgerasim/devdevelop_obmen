require "application_system_test_case"

class CryptocurrenciesTest < ApplicationSystemTestCase
  setup do
    @cryptocurrency = cryptocurrencies(:one)
  end

  test "visiting the index" do
    visit cryptocurrencies_url
    assert_selector "h1", text: "Cryptocurrencies"
  end

  test "creating a Cryptocurrency" do
    visit cryptocurrencies_url
    click_on "New Cryptocurrency"

    fill_in "Course", with: @cryptocurrency.course
    fill_in "Currency", with: @cryptocurrency.currency
    fill_in "Name", with: @cryptocurrency.name
    click_on "Create Cryptocurrency"

    assert_text "Cryptocurrency was successfully created"
    click_on "Back"
  end

  test "updating a Cryptocurrency" do
    visit cryptocurrencies_url
    click_on "Edit", match: :first

    fill_in "Course", with: @cryptocurrency.course
    fill_in "Currency", with: @cryptocurrency.currency
    fill_in "Name", with: @cryptocurrency.name
    click_on "Update Cryptocurrency"

    assert_text "Cryptocurrency was successfully updated"
    click_on "Back"
  end

  test "destroying a Cryptocurrency" do
    visit cryptocurrencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cryptocurrency was successfully destroyed"
  end
end
