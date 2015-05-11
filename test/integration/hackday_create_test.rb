require 'test_helper'

class HackdayCreateTest < ActionDispatch::IntegrationTest

  test "hackday must have a name" do
    assert_no_difference "Hackday.count" do
      post hackdays_path, :hackday => { :name => "  " }
    end
    assert_template "hackdays/index"
  end

  test "successfully create a hackday" do
    assert_difference "Hackday.count", 1 do
      post hackdays_path, :hackday => { :name => "Test hackday" }
    end
    follow_redirect!
    assert_template "hackdays/show"
  end
end
