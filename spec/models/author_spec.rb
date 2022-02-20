RSpec.describe Author, type: :model do
  before(:each) do
#  before(:all)
    @first_name = "A"
    @last_name = "B"
    @homepage = "https://amazing-homepage-of-a-b.erde"
    @author = Author.new(first_name: @first_name, last_name: @last_name, homepage: @homepage)
  end

  it "should be valid" do
    expect(@author).to be_valid
  end

  it "should assign first name to first_name" do
    expect(@author.first_name).to eq(@first_name)
  end

  it "should assign last name to last_name" do
    expect(@author.last_name).to eq(@last_name)
  end

  it "should assign homepage to homepage" do
    expect(@author.homepage).to eq(@homepage)
  end

  it "should concatenate first_name and last_name when calling name" do
    expect(@author.name).to eq(@first_name + ' ' + @last_name)
  end

  it "should only be valid if last_name is set" do
    @author.last_name = ""
    expect(@author).to_not be_valid
  end

  it "should have and belong to many papers" do
    relation = Author.reflect_on_association(:papers)
    expect(relation.macro).to eq(:has_and_belongs_to_many)
  end
end
