describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render without error" do
    visit new_paper_path
  end

  it "should have text inputs for a papers title, venue and year" do
    visit new_paper_path
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end
end
