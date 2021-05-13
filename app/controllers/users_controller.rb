class UsersController < ApplicationController

  def index
    @users = User.all
  end
    
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
      else
      render "new"
      end
  end

  # DELETE /posts/1
  def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end


########
private
#######

def user_params
  params.require(:user).permit(:first_name, :email,:password,:password_confirmation)
end