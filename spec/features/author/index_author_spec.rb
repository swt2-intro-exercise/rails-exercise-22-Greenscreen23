describe 'Author index page', type: :feature do
  it "should exist at 'index_author_path' and render without error" do
    visit authors_path
  end

  it "should contain a link to 'new_author_path'" do
    # When
    visit authors_path

    # Then
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should contain an html table for authors" do
    # When
    visit authors_path

    # Then
    expect(page).to have_table
    within('thead') do
      expect(page).to have_text('Name')
      expect(page).to have_text('Homepage')
    end
  end

  it "should contain the details and links for all authors in the database" do
    # Given
    FactoryBot.create :author
    authors = Author.all

    # When
    visit authors_path

    # Then
    authors.each do |author|
      expect(page).to have_text author.name
      expect(page).to have_link author.homepage, href: author.homepage
      expect(page).to have_link 'Details', href: author_path(author)
      expect(page).to have_link 'Edit', href: edit_author_path(author)
      expect(page).to have_link "Delete", href: author_path(author)
    end
  end

  it "should delete an author when delete is pressed" do
    # Given
    author = FactoryBot.create :author
    authors_count = Author.count

    # When
    visit authors_path
    find_link('Delete', href: author_path(author)).click

    # Then
    expect(Author.count).to be(authors_count-1)
  end
end
