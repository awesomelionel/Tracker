require 'spec_helper'

describe PagesController do

  it "sets correct page title for static pages" do
    get :home
    assigns[:title].should == 'Home'
    get :contact
    assigns[:title].should == 'Contact'
    get :about
    assigns[:title].should == 'About'
    get :help
    assigns[:title].should == 'Help'
  end

end
