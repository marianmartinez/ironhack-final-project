class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :home]
  before_action :set_user, only: [:show, :edit, :update]
  def new
    @user = User.new
    render :layout => "empty"
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = 'Welcome!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def set_user
    if current_user.admin? # current_user == User.admin
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :picture)
  end
end
