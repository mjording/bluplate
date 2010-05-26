require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User" do
  before(:each) do
    @user = Bluplate::User.find_by_email("test@tester.com") ? Bluplate::User.find_by_email("test@tester.com") : Bluplate::User.create(:email => "test@tester.com")
    
   # @user = User.new(:email => "test@tester.com", :inbox => {})
    #@user.save
  end
  it "should have an inbox " do
    
    
  end

  
  it "should import tasks from twitterstream filter" do
    
  end
  
  it "can have a workstream hash" do
    @user.workstream.class == Hash
    
  end
  
  it "can add a ticket to workstream from inbox task" do
    @task = Bluplate::Task.new(@user.email, "this is my task, there are many like it, but this one is mine")
    @user.inbox["test"] = @task.to_hash     
    @user.save
    @u = Bluplate::User.find_by_email(@user.email)
    @u.inbox.first == @task
    @ticket = Bluplate::Ticket.new(@u.inbox.first, @user.email)
    @u.workstream["test"] = @ticket.to_hash
    @u.save
    @uu = Bluplate::User.find_by_email(@user.email)
    @uu.workstream.first == @ticket
  end
  
  it "should have a hash list of contacts" do
    @user.contacts.should_not == nil
    @user.contacts.class == Hash
  end
  it "can import contact from twitter" do
    @user.contacts[]
    @user.contacts.class == Hash
  end
  
  it "should return a User object on find_by_email" do
    @user.save
    Bluplate::User.find_by_email(@user.email).class.should ==  Bluplate::User
  end
  
  it "should persist" do
    @user.save
    @u = Bluplate::User.find_by_email(@user.email)
    @u.should_not == nil
  end
  
  
end