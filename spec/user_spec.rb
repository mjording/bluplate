require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User" do
  before(:each) do
    @user = User.find_by_email("test@tester.com") ? User.find_by_email("test@tester.com") : User.create(:email => "test@tester.com")
    
   # @user = User.new(:email => "test@tester.com", :inbox => {})
    #@user.save
  end
  it "should have an inbox hash of tasks" do
    
    @user.inbox.class == Hash
    @task = Task.new(@user.email, "this is my task, there are many like it, but this one is mine")
    @user.inbox["test"] = @task.to_hash
    @user.inbox["test"].class == Task
    @user.save
  end
  
  it "can have a workstream hash" do
    @user.workstream.class == Hash
    
  end
  
  it "can add a ticket to workstream from inbox task" do
    @task = Task.new(@user.email, "this is my task, there are many like it, but this one is mine")
    @user.inbox["test"] = @task.to_hash     
    @user.save
    @u = User.find_by_email(@user.email)
    @u.inbox.first == @task
    @ticket = Ticket.new(@u.inbox.first, @user.email)
    @u.workstream["test"] = @ticket.to_hash
    @u.save
    @uu = User.find_by_email(@user.email)
    @uu.workstream.first == @ticket
  end
  
  it "should have a hash list of contacts" do
    @user.contacts.should_not == nil
    @user.contacts.class == Hash
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