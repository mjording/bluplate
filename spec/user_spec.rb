require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User" do
  it "should have an inbox list of tasks" do
    @user = User.new
    @user.inbox.class == Array
    @task = Task.new
    @user.inbox << @task
    @user.inbox.first.class == Task
  end
end