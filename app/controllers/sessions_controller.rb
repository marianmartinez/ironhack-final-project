class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  layout "empty"

  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      flash[:success] = 'Welcome back!'
      redirect_back_or_to root_path
    else
      @user = User.new
      flash.now[:error] = 'E-mail and/or password is incorrect.'
      render :action => "new"
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
