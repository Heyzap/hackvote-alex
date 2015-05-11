require 'test_helper'

class HackdayVotingTest < ActionDispatch::IntegrationTest

  test "closed hackdays are unvotable" do
    hackday = hackdays(:asdf)
    patch hackday_path(hackday)
    assert_not hackday.reload.votable
    assert_redirected_to hackday_path(hackday)
    follow_redirect!
    assert_select "input[type=submit]", :count => 0
    hackday.projects.each do |proj|
      assert_match "-- #{proj.votes} votes", response.body
    end
  end
end
