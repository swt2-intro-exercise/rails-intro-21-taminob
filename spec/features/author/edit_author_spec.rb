require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit edit_author_path(1)
  end
end
