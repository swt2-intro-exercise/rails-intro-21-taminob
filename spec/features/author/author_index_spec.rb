require 'rails_helper'

describe "Authors index page", type: :feature do
  before(:each) do
    @author = create(:author)
    visit authors_path
  end

  it "should contain table" do
    expect(page).to have_css("table")
  end

  it "should contain Name and Homepage in table" do
    within "table" do
      expect(page).to have_text("Name")
      expect(page).to have_text("Homepage")
    end
  end

  it "should contain author name" do
    expect(page).to have_text(@author.name)
  end

  it "should contain author homepage" do
    expect(page).to have_text(@author.homepage)
  end

  it "should contain link to new author page" do
    expect(page).to have_link 'New', href: new_author_path
  end
end

