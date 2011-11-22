require 'spec_helper'

describe ProjectsController do

  it "displays an error for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    message = "The project you were looking for could not be found."
    flash[:alert].should eql(message)
  end

  it "puts project title into page title" do
    @project = Factory(:project, :name => 'Test title')
    get :show, :id => @project.id
    assigns[:title].should  include(@project.name)
  end

end
