class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :like]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update]

  def index
    @recipe = Recipe.paginate(page: params[:page], per_page: 6)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef   = Chef.find(1)

    if @recipe.save
      flash[:success] = "Your Recipe successfully save"
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "You Recipe successfully Updated"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def like
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your selection was successfull"
      redirect_to :back
    else
      flash[:danger] = "You can like/dislike a recipe once"
      redirect_to :back
    end
  end

  private
  def recipe_params
    params.require("recipe").permit("name", "summary", "description", "picture")
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def require_same_user
    if current_user != @chef
      flash[:danger] = "You don't have access to that service"
      redirect_to root_path
    end
  end
end