require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Ticket" do
  
  before(:each) do
    @u = Bluplate::User.find_by_email("test@tester.com") ? Bluplate::User.find_by_email("test@tester.com") : Bluplate::User.create(:email => "test@tester.com")
    @task = Bluplate::Task.new(@u.email, "this is my task, there are many like it, but this one is mine")
    @u.inbox["test"] = @task.to_hash
    @u.save
   
  end

  it "should have a task" do
    
    @ticket = Bluplate::Ticket.new(@task, @u.email)
    @ticket.task.should_not == nil
    @ticket.task.class.should == Bluplate::Task
  end
  
end