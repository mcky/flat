require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a name" do
    user = User.new
    assert !user.save
    assert !user.errors[:name].empty?
  end
  
  test "a user should have a unique name" do 
    user = User.new
    user.name = users(:ross).name
    assert !user.save
    assert !user.errors[:name].empty?
  end
  
  test "a user should have a name without spaces" do
    user = User.new
    user.name = "My name with spaces"
    assert !user.save
    assert !user.errors[:name].empty?
    assert user.errors[:name].include?("must be formatteded correctly")
  end
end
