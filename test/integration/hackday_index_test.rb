require 'test_helper'

class HackdayIndexTest < ActionDispatch::IntegrationTest

  def setup
    @hackdays = Hackday.all
  end

  test "list all current hackdays" do
    get hackdays_path
    @hackdays.each do |hackday|
      assert_select "a[href=?]", hackday_path(hackday), :text => hackday.name
    end
  end

  test "can't create no-name hackday" do
    assert_no_difference "Hackday.count" do
      post hackdays_path, :hackday => { :name => "" }
    end
    assert_template "hackdays/index"
    assert_select "ul#error-messages"
  end

  test "successfully create valid hackday" do
    get hackdays_path
    assert_difference "Hackday.count", 1 do
      post hackdays_path, :hackday => { :name => "Test hackday" }
    end
  end
end
