require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should create a new author when a user fills the fields and submits" do
    # Given
    visit new_author_path
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"
    author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)

    # When
    page.fill_in('author[first_name]', with: first_name)
    page.fill_in('author[last_name]', with: last_name)
    page.fill_in('author[homepage]', with: homepage)
    find('input[type="submit"]').click

    # Then
    expect(Author.last).to eq(author)
  end

  it "should show an error when trying to create an invalid author" do
    # Given
    visit new_author_path
    first_name = "Alan"
    last_name = "" # Intentionally left empty
    homepage = "http://wikipedia.org/Alan_Turing"

    # When
    page.fill_in('author[first_name]', with: first_name)
    page.fill_in('author[last_name]', with: last_name)
    page.fill_in('author[homepage]', with: homepage)
    find('input[type="submit"]').click

    # Then
    expect(page).to have_selector('div#error_explanation')
  end
end
