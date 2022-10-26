describe "Author", type: :model do
  it "should have a first name, last name and a homepage" do
    # Given
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"

    # When
    author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)

    # Then
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end

  it "should concatinate first name and last name to name" do
    # Given
    first_name = "Alan"
    last_name = "Turing"
    name = "Alan Turing"

    # When
    author = Author.new(:first_name => first_name, :last_name => last_name)

    # Then
    expect(author.name).to eq(name)
  end

  it "should compare different authors" do
    # Given
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"
    different_first_name = "Edsger Wybe"
    different_last_name = "Dijkstra"
    different_homepage = "https://de.wikipedia.org/wiki/Edsger_W._Dijkstra"

    # When
    author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)
    similar_author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)
    different_author = Author.new(:first_name => different_first_name, :last_name => different_last_name, :homepage => different_homepage)

    # Then
    expect(author).to eq(similar_author)
    expect(author).not_to eq(different_author)
  end
end
