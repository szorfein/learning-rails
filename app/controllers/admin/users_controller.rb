class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:email)
  end

  def show 
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User has been created.' }
      else
        flash.now[:alert] = "User has not been created."
        render "new"
      end
    end
  end

  def update
    respond_to do |format|

      if params[:user][:password].blank?
        params[:user].delete(:password)
      end

      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: "User has been updated." }
      else
        flash.now[:alert] = "User has not been updated."
        render "edit"
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
