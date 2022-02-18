class FinePointsController < ApplicationController
  before_action :set_fine_point, only: %i[ show edit update destroy ]

  def index
    @fine_points = FinePoint.all.paginate(page: params[:page], per_page: 2)
  end
  def new
    @fine_point = FinePoint.new
  end
  def show; end
  def edit; end

  def create
    @fine_point = FinePoint.new(fine_point_params)
    @fine_point.company = current_company
    @fine_point.created_by = current_user

    respond_to do |format|
      if @fine_point.save
        format.html { redirect_to fine_point_url(@fine_point), notice: "Fine point was successfully created." }
        format.json { render :show, status: :created, location: @fine_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fine_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fine_point.update(fine_point_params)
        format.html { redirect_to fine_point_url(@fine_point), notice: "Fine point was successfully updated." }
        format.json { render :show, status: :ok, location: @fine_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fine_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fine_point.destroy
    @company = current_company
    respond_to do |format|
      format.html { redirect_to fine_points_url, notice: "Fine point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fine_point
      @fine_point = FinePoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fine_point_params
      params.require(:fine_point).permit(:name, :point)
    end
end
