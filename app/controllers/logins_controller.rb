class LoginsController < ApplicationController
  def new
  end

  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "Successfully login"
      redirect_to recipes_path
    else
      flash[:danger] = "Invaild Email_id or Password"
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logout"
    redirect_to root_path
  end
end