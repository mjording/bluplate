require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Task" do
  before(:each) do
    @task = Task.new
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
  
  
end