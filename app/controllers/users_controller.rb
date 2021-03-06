class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id, only: :enable_disable
  before_action :set_company, only: [:new, :create, :edit, :update]
  # before_action :set_msg, only: [:new, :create, :edit, :update]

  helper_method :authorized_users
  def authorized_users
    if current_user.admin?
      User.all
    elsif current_user.manager?
      User.all.where.not(user_type: :admin)
    else
      User.all.where(user_type: :users)
    end
  end

  # -------------------------------------------------------------
  def index
    #@users = User.all.paginate(page: params[:page], per_page: 2)
    @users = User.paginate(page: params[:page], per_page: 2)
  end
  def new
    @user = User.new
  end
  def show; end
  def edit; end

  def create
    @user = User.new(user_params)
    @user.created_by = current_user
    @user.company = current_company unless current_user.admin?
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: Translate.created_msg(controller_name.classify), alert: "alert-success" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to new_user_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: Translate.updated_msg(controller_name.classify) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to edit_user_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: Translate.destroyed_msg(controller_name.classify) }
    end
  end

  def enable_disable
    status = "enabled" == @user.status ? "disabled" : "enabled"
    @user.status = status
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
        format.js { render layout: false, locals: { msg: "status...#{enable_disable_msg(status)}" } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render layout: false}
      end
    end
  end

  private

  def set_company
    @main = Company.where(company_type: :main)
    @branches = Company.where(company_type: :branch)
    @Companies = Company.all
  end

  def set_user
    @user = User.find(params[:id])
  end
  def set_user_id
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :status, :user_type, :company_id, :created_by)
  end
end
