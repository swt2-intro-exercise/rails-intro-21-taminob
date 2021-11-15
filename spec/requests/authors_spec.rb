require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /index" do
    it "should create an author and deliver it afterwards" do
      get "/authors/new"
      expect(response).to render_template(:new)

      post "/authors", :params => { :author => {:first_name => "A", :last_name => "B", :homepage => "C"} }
      expect(response).to redirect_to(assigns(:author))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("B")
    end
  end
end
