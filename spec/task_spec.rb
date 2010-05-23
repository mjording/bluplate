require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Task" do
  
  before(:each) do
    @task = Task.new("this is my task, there are many like it, but this one is mine")
    @u = User.find_by_email("test@tester.com") ? User.find_by_email("test@tester.com") : User.create(:email => "test@tester.com")
  end

  it "should have a list of tags" do
    @task.tags.class == Array
  end
  
  it "should have a history of hashes" do
    @task.history.class == Array
    h = {}
    @task.history << h
    @task.history.first.class == Hash
  end
  
  it "should persist" do
    @u.class.should == User
    @u.inbox.class.should == Array
    @u.inbox << @task
    @u.save
    @user = User.find_by_email(@u.email)
    @user.inbox.first == @task
  end
   
  it "should have a description" do
    @u.inbox << @task
    @u.save
    @user = User.find_by_email(@u.email)
    @user.inbox.class.should == Array
    @user.inbox.first.class.should == Task
    puts "blah one #{@user.inbox}"
    puts "blah #{@user.inbox.first.inspect}"
    @user.inbox.first.description.should_not == nil
    @user.inbox.first.description.should == @task.description
  end
  
end