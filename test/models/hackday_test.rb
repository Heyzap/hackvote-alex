require 'test_helper'

class HackdayTest < ActiveSupport::TestCase

  def setup
    @hackday = Hackday.new(:name => "Test")
  end

  test "must have a name" do
    @hackday.name = nil
    assert_not @hackday.valid?
  end

  test "name max length is 50" do
    @hackday.name = "a"*51
    assert_not @hackday.valid?
  end
end
