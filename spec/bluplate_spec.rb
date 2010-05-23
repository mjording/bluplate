require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Bluplate" do
  it "should have a user" do
    user = User.new
    user.class.should == User
  end
end
