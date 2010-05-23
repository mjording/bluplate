require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User" do
  before(:each) do
    @user = User.new(:email => "test@tester.com", :inbox => {})
  end
  it "should have an inbox list of tasks" do
    
    @user.inbox.class == Hash
    @task = Task.new("this is my task, there are many like it, but this one is mine")
    @user.inbox["test"] = @task
    @user.inbox["test"].class == Task
  end
  
  it "should return a User object on find_by_email" do
    @task = Task.new(@u.email, "this is my task, there are many like it, but this one is mine")
    @user.inbox["test"] = @task
    @user.save
    User.find_by_email(@user.email).class.should == User
  end
  
  it "should persist" do
    @task = Task.new(@u.email, "this is my task, there are many like it, but this one is mine")
    @user.inbox["test"] = @task
    @user.save
    @u = User.find_by_email(@user.email)
    @u.should_not == nil
  end
end