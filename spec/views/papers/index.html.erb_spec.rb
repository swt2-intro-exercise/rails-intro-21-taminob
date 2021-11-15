require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
    @example_paper = create(:paper)
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Other Title",
        venue: "Other Venue",
        year: @example_paper.year + 1
      ),
      @example_paper
    ])
  end

  it "renders a list of papers" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Venue".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end

  it "filters according to given year in url" do
    #redirect_to_url authors_path(year: @example_paper.year + 1)
    assign(:papers, Paper.released_in_year(@example_paper.year))
    render
    expect(response).to have_css("tr>td", :text => @example_paper.year.to_s, :count => 1)
  end
end
