require 'rails_helper'

=begin
RSpec.describe "Category endpoint", type: :request do
  describe "get 200" do

    it "should return ok" do
      get '/categories'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end
  describe "get with content" do
    let!(:category){create(:category)}

    it "should return status code 200" do
      get '/categories'
      payload = JSON.parse(response.body)
      expect(payload.first["name"]).to eq(category.name)
      expect(response).to have_http_status(200) 
    end
  end
end
=end

