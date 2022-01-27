class FinesController < ApplicationController
  before_action :set_fine, only: %i[ show edit update destroy ]
  before_action :fill_fields, only: [:new, :create, :edit, :update]
  # GET /fines or /fines.json
  def index
    @fines = Fine.all
  end

  # GET /fines/1 or /fines/1.json
  def show
  end

  # GET /fines/new
  def new
    @fine = Fine.new
  end

  # GET /fines/1/edit
  def edit
  end

  # POST /fines or /fines.json
  def create
    @fine = Fine.new(fine_params)

    respond_to do |format|
      if @fine.save
        format.html { redirect_to fine_url(@fine), notice: created_msg }
        format.json { render :show, status: :created, location: @fine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fine.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to new_fine_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  # PATCH/PUT /fines/1 or /fines/1.json
  def update
    respond_to do |format|
      if @fine.update(fine_params)
        format.html { redirect_to fine_url(@fine), notice: updated_msg }
        format.json { render :show, status: :ok, location: @fine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fine.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to edit_fine_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  # DELETE /fines/1 or /fines/1.json
  def destroy
    @fine.destroy

    respond_to do |format|
      format.html { redirect_to fines_url, notice: destroyed_msg }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fine
      @fine = Fine.find(params[:id])
    end

    def fill_fields
      @users = User.all
      @branches = Company.where(company_type: :branch)
    end

    # Only allow a list of trusted parameters through.
    def fine_params
      params.require(:fine).permit(:user_id, :fine_date, :fine_status, :fine_number, :branch_id, :company_type)
    end
end
