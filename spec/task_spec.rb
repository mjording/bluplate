require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Task" do
  
  before(:each) do
     @u = User.find_by_email("test@tester.com") ? User.find_by_email("test@tester.com") : User.create(:email => "test@tester.com")
    @task = Task.new(@u.email, "this is my task, there are many like it, but this one is mine")
   
  end

  it "should have a list of tags" do
    @task.tags.class == Hash
  end
  
  it "should have a history of hashes" do
    @task.history.class == Hash
    h = {}
    @task.history["test"] = h
    @task.history.first.class == Hash
  end
  
  it "should persist" do
    @u.class.should == User
    @u.inbox.class.should == Hash
    @u.inbox["test"] = @task.to_hash
    @u.save
    @user = User.find_by_email(@u.email)
    @user.inbox.first == @task
  end
   
  it "should have a description" do
    @u.inbox["test"] = @task.to_hash
    @u.save
    @user = User.find_by_email(@u.email)
    
    puts "blah one #{@user.inbox} #{@user.inbox["test"]}"
    puts "blah #{@user.inbox.first.inspect}"
    #@user.inbox.class.should == Hash
    #@user.inbox.class.should == Array
    
    @user.inbox["test"].should_not == nil
    
    @user.inbox["test"]["description"].should == @task.description
  end
  
end