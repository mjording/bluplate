require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Bluplate" do
  before(:each) do
     @user = User.new(:email => "test@tester.com")
  end
  it "should have a user" do
    
    @user.class.should == User
  end
end
