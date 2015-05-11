require 'test_helper'

class HackdaysControllerTest < ActionController::TestCase

  test "get root" do
    get :index
    assert_response :success
    assert_select "title", "Alex's Implementation of Hackvote"

    Hackday.all.each do |h|
      assert_select "a[href=?]", hackday_path(h), :text => h.name
    end
  end

  test "get hackday page" do
    hackday = hackdays(:asdf)
    get :show, :id => hackday.id
    assert_select "h1", :text => hackday.name

    hackday.projects.each do |project|
      assert_select "span.project-details", "#{project.name} (by #{project.creators})"
    end
  end

  test "close hackday" do
    hackday = hackdays(:asdf)
    patch :update, :id => hackday
    assert_not hackday.reload.votable
    assert_redirected_to hackday_path(hackday)
  end
end
