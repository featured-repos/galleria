class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup(@user).deliver
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Show Me What You Got, #{@user.username}!"
      redirect_to :dashboard
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :avatar, :bio)
  end

end
