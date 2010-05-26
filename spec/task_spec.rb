require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Task" do
  
  before(:each) do
     @u = Bluplate::User.find_by_email("test@tester.com") ? Bluplate::User.find_by_email("test@tester.com") : Bluplate::User.create(:email => "test@tester.com")
    @task = Bluplate::Task.new(@u.email, "this is my task, there are many like it, but this one is mine")
   
  end

  it "should have a list of tags" do
    @task.tags.class == Hash
  end
  
  it "should persist" do
    @u.class.should == Bluplate::User
    @u.inbox["test"] = @task.to_hash
    @u.save
    @user = Bluplate::User.find_by_email(@u.email)
    @user.inbox.first == @task
  end
   
  it "should have a description" do
    @u.inbox["test"] = @task.to_hash
    @u.save
    @user = Bluplate::User.find_by_email(@u.email)
    
    
    @user.inbox["test"].should_not == nil
    
    @user.inbox["test"]["description"].should == @task.description
  end
  
end