require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new(title: "Title 1", detail: "this is detail", user_id: 1)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "title required" do
    @task.title = ""
    assert_not @task.valid?
  end

  test "must belongs to user" do
    @task.user_id = ""
    assert_not @task.valid?
  end
end
