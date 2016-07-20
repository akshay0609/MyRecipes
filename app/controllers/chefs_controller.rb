class ChefsController < ApplicationController
  before_action :require_user, except: [:new, :create]
  def index
    @chef = Chef.paginate(page: params[:page], per_page: 5)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      flash[:success] = "Thank you for Register"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end

end