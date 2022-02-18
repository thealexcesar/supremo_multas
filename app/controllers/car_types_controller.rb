class CarTypesController < ApplicationController
  before_action :set_car_type, only: %i[ show edit update destroy ]

  def index
    @car_types = CarType.all.paginate(page: params[:page], per_page: 2)
  end
  def new
    @car_type = CarType.new
  end
  def show; end
  def edit; end

  # POST /car_types or /car_types.json
  def create
    @car_type = CarType.new(car_type_params)
    @car_type.company = current_company
    @car_type.created_by = current_user

    respond_to do |format|
      if @car_type.save
        format.html { redirect_to car_type_url(@car_type), notice: created_msg }
        format.json { render :show, status: :created, location: @car_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car_type.errors, status: :unprocessable_entity }
      end
    end
=begin
  rescue
    redirect_to new_car_type_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
=end
  end

  # PATCH/PUT /car_types/1 or /car_types/1.json
  def update
    respond_to do |format|
      if @car_type.update(car_type_params)
        format.html { redirect_to car_type_url(@car_type), notice: updated_msg }
        format.json { render :show, status: :ok, location: @car_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car_type.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to edit_car_type_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  # DELETE /car_types/1 or /car_types/1.json
  def destroy
    @car_type.destroy

    respond_to do |format|
      format.html { redirect_to car_types_url, notice: destroyed_msg }
      format.json { head :no_content }
    end
  end

  private

  def set_car_type
    @car_type = CarType.find(params[:id])
  end
  def car_type_params
    params.require(:car_type).permit(:name)
  end
end
