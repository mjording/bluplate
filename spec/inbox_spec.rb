require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
describe "Inbox" do
  before(:each) do
    @user = Bluplate::User.find_by_email("test@tester.com") ? Bluplate::User.find_by_email("test@tester.com") : Bluplate::User.create(:email => "test@tester.com")
    @inbox =  Bluplate::Inbox.new
  end
  
  it "should have a hash of tasks" do
    @inbox.tasks.class == Hash
    @task = Bluplate::Task.new(@user.email, "this is my task, there are many like it, but this one is mine")
    @inbox.tasks["test"] = @task.to_hash
    @inbox.tasks["test"].class ==  Bluplate::Task
    @inbox.save
  end
  
  it "should be able to retrieve tasks from a source" do
    @inbox.retrieve
    @inbox.tasks.should_not be nil
  end
  
end