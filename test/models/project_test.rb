require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @hackday = hackdays(:asdf)
    @proj = @hackday.projects.build(:name => "Test project",
        :creators => "Alessio")
  end


  test "must have an associated hackday" do
    @proj.hackday_id = nil
    assert_not @proj.valid?
  end

  test "must have a name" do
    @proj.name = "   "
    assert_not @proj.valid?
  end

  test "must have creators" do
    @proj.creators = "   "
    assert_not @proj.valid?
  end
end
