require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Bluplate" do
  before(:each) do
     @user = Bluplate::User.new(:email => "test@tester.com")
  end
  it "should have a user" do
    
    @user.class.should ==  Bluplate::User
  end
end
