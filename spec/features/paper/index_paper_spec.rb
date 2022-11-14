describe 'Paper index page', type: :feature do
  it "should exist at 'index_paper_path' and render without error" do
    visit papers_path
  end

  it "should contain a link to each papers edit and delete pages" do
    # Given
    paper = FactoryBot.create :paper
    paper.save

    # When
    visit papers_path

    # Then
    Paper.all.each do |paper|
      expect(page).to have_link 'Edit', href: edit_paper_path(paper)
      delete_button = find_link 'Delete', href: paper_path(paper)
      expect(page).to have_css "a[data-turbo-method='delete']"
    end
  end
end
