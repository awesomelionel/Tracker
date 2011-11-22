require 'spec_helper'

describe TicketsController do

  it "displays error when there is no such ticket" do
    @project = Factory(:project)
    get :show, :project_id => @project.id, :id => "0"
    response.should redirect_to(project_path(@project.id))
    message = "The ticket you were looking for could not be found."
    flash[:alert].should eql(message)
  end

  it "displays error when there is no such project when we request a ticket" do
    get :show, :project_id => 0, :id => 0
    response.should redirect_to(projects_path)
    message = "The project you were looking for could not be found."
    flash[:alert].should eql(message)
  end

end
