require 'rails_helper'

RSpec.describe Paper, type: :model do
  before(:all) do
    @paper = create(:paper)
  end

  it "should be valid" do
    expect(@paper).to be_valid
  end
end
