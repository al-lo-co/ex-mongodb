require 'rails_helper'

=begin
RSpec.describe "Tasks endpoint", type: :request do
  describe "get 200" do

    it "should return ok" do
      get '/tasks'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end
  describe "get with content" do
    let!(:task){create(:task)}

    it "should return status code 200" do
      get '/tasks'
      payload = JSON.parse(response.body)
      expect(payload.first["name"]).to eq(task.name)
      expect(response).to have_http_status(200) 
    end
  end
end
=end