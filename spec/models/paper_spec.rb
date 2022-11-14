describe "Paper", type: :model do
  it "should not allow creating an author with non-integer year" do
    # Given
    title = "my paper"
    venue = "Mind 49: 433-460"
    year = "nineteen-fifty"

    # When
    paper = Paper.new(title: title, venue: venue, year: year)

    # Then
    expect(paper).to_not be_valid
  end
end
