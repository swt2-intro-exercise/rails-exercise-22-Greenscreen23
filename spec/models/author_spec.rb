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
end
