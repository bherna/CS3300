#https://relishapp.com/rspec/rspec-rails/docs/model-specs

#create a unit test for Projects model

require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do


    it "ensures the title is present" do
      #by creating a new project, if we give it only a description
      #it should nt be created and should return false due to validates_presence_of
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the description is present" do
      #by creating a new project, if we only give it a title
      #it should not be created and should return false due to validates_presence_of
      project = Project.new(title: "some random title")
      expect(project.valid?).to eq(false)
    end

    
    it "should be able to save project" do
      #by creeating anew project with a title and description
      #only then will it create a project and return true.
      #project.save is a built in function that saves the class into the db,
      #a perform_validation is ran to see if save was successfull, true, else false.
      #https://apidock.com/rails/ActiveRecord/Base/save
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end



  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end

    end
end

