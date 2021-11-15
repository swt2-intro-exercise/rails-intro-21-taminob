require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    @paper = assign(:paper, Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end

  it "should not contain authors if there are none" do
    @paper.authors.clear
    render
    expect(rendered).not_to have_css("#authors")
  end

  it "should contain authors" do
    @paper.authors = [create(:author)]
    render
    expect(rendered).to have_css("#authors")
  end
end
