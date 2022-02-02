class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :set_car_models, only: [ :new, :edit ]
  before_action :set_car_id, only: :enable_disable

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    @car.company = current_company
    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: created_msg }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
=begin
  rescue
    redirect_to new_car_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
=end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: updated_msg }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to edit_car_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: destroyed_msg }
      format.json { head :no_content }
    end
  end

  def enable_disable
    status = "enabled" == @car.status ? "disabled" : "enabled"
    @car.status = status
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car }
        format.json { render :show, status: :ok, location: @car }
        format.js { render layout: false, locals: { msg: enable_disable_msg(status) } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    def set_car_models
      @car_models = CarModel.all
    end

    def set_car_id
      @car = Car.find(params[:car_id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:year, :license_plate, :status, :car_model_id)
    end
end
