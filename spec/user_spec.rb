require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User" do
  before(:each) do
    @user = User.new("test@tester.com")
  end
  it "should have an inbox list of tasks" do
    
    @user.inbox.class == Array
    @task = Task.new
    @user.inbox << @task
    @user.inbox.first.class == Task
  end
  it "should persist" do
    @user.save
    @user.db.collection("users").find_one({"email" => @user.email}).each{ |doc| doc.inspect }.should_not == nil
    @u = User.find_by_email(@user.email)
    @u.should_not == nil
  end
end