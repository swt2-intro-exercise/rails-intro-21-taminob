require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should display error when trying to submit invalid author" do
    visit new_author_path
    submit_form()
    expect(page).to have_css(".error")
  end
end
