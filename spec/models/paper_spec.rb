require 'rails_helper'

RSpec.describe Paper, type: :model do
  before(:each) do
    @paper = create(:paper)
  end

  it "should be valid" do
    expect(@paper).to be_valid
  end

  it "should be invalid without title" do
    @paper.title = nil
    expect(@paper).to be_invalid
  end

  it "should be invalid without venue" do
    @paper.venue = nil
    expect(@paper).to be_invalid
  end

  it "should be invalid without year" do
    @paper.year = nil
    expect(@paper).to be_invalid
  end

  it "should be invalid with non-numeric year" do
    @paper.year = "x"
    expect(@paper).to be_invalid
  end

  it "should contain an list of authors" do
    @paper.authors.each do |author|
      expect(author).to be_an_instance_of(Author)
    end
  end
end
