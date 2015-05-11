require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def setup
    @project = projects(:bad_proj)
    @hackday = @project.hackday
  end

  test "vote on a project" do
    patch :update, :id => @project
    assert_equal 1, @project.reload.votes
    assert_template 'hackdays/show'
    assert_equal 1, cookies[:"votes_#{@hackday.id}"].to_i
  end

  test "maximum 3 votes" do
    cookies[:"votes_#{@hackday.id}"] = 3
    patch :update, :id => @project
    assert_equal 0, @project.votes
    assert_select ".project-votes", count: 0
  end
end
