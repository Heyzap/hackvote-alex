require 'test_helper'

class AddProjectTest < ActionDispatch::IntegrationTest

  def setup
    @hackday = hackdays(:asdf)
  end

  test "add a project" do
    get hackday_path(@hackday)
    assert_template 'hackdays/show'

    # invalid submission
    assert_no_difference "Project.count" do
      post projects_path, :project => { :name => "", :creators => "" }, :hackday_id => @hackday.id
    end
    assert_template "hackdays/show"
    assert_select "#error-messages"
    assert_select "#projects-list ul", text: "(by )", count: 0

    # valid submission
    assert_difference "Project.count", 1 do
      post projects_path, :project => { :name => "Project 1", :creators => "alessio" }, :hackday_id => @hackday.id
    end
    assert_redirected_to hackday_path(@hackday)

  end
end
