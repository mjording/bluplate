require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Ticket" do
  
  before(:each) do
    @u = User.find_by_email("test@tester.com") ? User.find_by_email("test@tester.com") : User.create(:email => "test@tester.com")
    @task = Task.new(@u.email, "this is my task, there are many like it, but this one is mine")
    @u.inbox["test"] = @task.to_hash
    @u.save
   
  end

  it "should have a task" do
    
    @ticket = Ticket.new(@task, @u.email)
    @ticket.task.should_not == nil
    @ticket.task.class.should == Task
  end
  
end