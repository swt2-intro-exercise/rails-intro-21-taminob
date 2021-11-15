require 'rails_helper'

RSpec.describe Author, type: :model do
  before(:each) do
#  before(:all)
    @author = Author.new
  end

  it "should be valid with valid attributes" do
    @author.first_name = "A"
    @author.last_name = "B"
    @author.homepage = "https://amazing-homepage-of-a-b.erde"
    expect(@author).to be_valid
  end
end
