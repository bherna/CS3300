#https://relishapp.com/rspec/rspec-rails/docs/controller-specs


#creating a functional test for projects controller

require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do

    #expects that using the get method will return a response
    it "returns a success response" do

      #http method: get/#index
      get :index
      puts response.body.inspect

      #expects repsonse to be status code success/true/200
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }

    #expects to get a response and that the project is create
    it "returns a success response" do

      #http method: get/#index/#id
      get :show, params: { id: project }

      #expect the response to be true (from get method and project being created)
      expect(response).to be_success
    end
  end
end

