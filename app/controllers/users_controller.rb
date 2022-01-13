class UsersController < ApplicationController
=begin
  before_action :set_user, only: %i[ new create show edit update destroy ]
=end
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User as successfull created."}
      end
    end
  end

  private
=begin
  def set_user
    @user = User.find(params[:id])
  end
=end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :status, :user_type)
  end
end
