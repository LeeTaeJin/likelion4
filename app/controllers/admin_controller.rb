class AdminController < ApplicationController
  def main
  end
  
  def delete_user
    @user = User.find(params[:id])
    
    @user.destroy
    redirect_to :back
  end
  
  def edit_user
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.save
    
    redirect_to :back
  end
  
  
end
