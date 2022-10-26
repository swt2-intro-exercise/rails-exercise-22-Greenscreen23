describe 'Show author page', type: :feature do
  it "should exist at 'show_author_path' and render without error" do
    author = FactoryBot.create :author
    visit author_path(author)
  end

  it "should show the relevant author details" do
    # Given
    author = FactoryBot.create :author

    # When
    visit author_path(author)

    # Then
    expect(page).to have_text(author.first_name)
    expect(page).to have_text(author.last_name)
    expect(page).to have_text(author.homepage)
  end
end
