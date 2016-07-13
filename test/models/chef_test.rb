require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Akshay", email: "akshay.sharma@krixi.in")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end

  test "name length should not be too short" do
    @chef.chefname = "test"
    assert_not @chef.valid?
  end

  test "name length should not be too long" do
    @chef.chefname = "test" * 25
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email should be within bound" do
    @chef.email = "a" * 51 + "@example.com"
    assert_not @chef.valid?
  end

  test "email should be unique" do
    chef_dup = @chef.dup
    @chef.save
    assert_not chef_dup.valid?
  end

  test "email validation should be accept valid address" do
    valid_address = %w[AAA-aaa@example.com aaa_aaa@example.com aaa@aa.com]
    valid_address.each do |email|
      @chef.email = email
      assert @chef.valid?, "#{email} should be valid"
    end
  end

  test "email validation should not be accept invalid address " do
    invalid_address = %w[aaa@cc aaa@aa+exaple.com aaaa.com]
    invalid_address.each do |invalid_email|
      @chef.email = invalid_email
      assert_not @chef.valid?, "#{invalid_email} should not be valid"
    end
  end
end