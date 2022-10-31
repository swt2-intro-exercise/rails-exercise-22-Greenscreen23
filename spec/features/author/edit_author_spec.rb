describe 'Edit author page', type: :feature do
  it "should exist at 'edit_author_path' and render without error" do
    author = FactoryBot.create :author
    visit edit_author_path(author)
  end

  it "should allow editing a given author" do
    # Given
    author = FactoryBot.create :author
    author.save
    visit edit_author_path(author)

    new_first_name = "Edsger Wybe"
    new_last_name = "Dijkstra"
    new_homepage = "https://de.wikipedia.org/wiki/Edsger_W._Dijkstra"
    new_author = Author.new(:first_name => new_first_name, :last_name => new_last_name, :homepage => new_homepage)

    # When
    page.fill_in('author[first_name]', with: new_first_name)
    page.fill_in('author[last_name]', with: new_last_name)
    page.fill_in('author[homepage]', with: new_homepage)
    find('input[type="submit"]').click

    author.reload

    # Then
    expect(author).to eq(new_author)
  end
end
