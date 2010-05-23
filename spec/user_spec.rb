require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User" do
  before(:each) do
    @user = User.new("test@tester.com")
  end
  it "should have an inbox list of tasks" do
    
    @user.inbox.class == Array
    @task = Task.new(:description => "this is my task, there are many like it, but this one is mine")
    @user.inbox << @task
    @user.inbox.first.class == Task
  end
  
  it "should return a User object on find_by_email" do
    @user.save
    User.find_by_email(@user.email).class.should == User
  end
  
  it "should persist" do
    @user.save
    @u = User.find_by_email(@user.email)
    @u.should_not == nil
  end
end