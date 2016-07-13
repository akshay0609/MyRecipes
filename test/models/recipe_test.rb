require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "Akshay", email: "akshay@example.com")
    @recipe = @chef.recipes.build(name: "Special Tea", summary: "make a tea in 2min", description: "For tea require water, sugar, milk etc")
  end

  test "recipe should be valid" do
    @recipe.valid?
    puts @recipe.errors.full_messages
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should not be too short" do
    @recipe.name = "Tea"
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do
    @recipe.summary = "test"
    assert_not @recipe.valid?
  end

  test "summary length should not be too long" do
    @recipe.summary = "test" * 201
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description length should not be to short" do
    @recipe.description = "test"
    assert_not @recipe.valid?
  end

  test "description length should not be too long" do
    @recipe.description = "test" * 4001
    assert_not @recipe.valid?
  end

  test "chef ID should be present" do
    @recipe.chef_id = ''
    assert_not @recipe.valid?
  end
end
