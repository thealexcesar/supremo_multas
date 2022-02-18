class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  before_action :get_city, only: [:new, :edit]
  # GET /companies or /companies.json
  def index
    @companies = Company.all.paginate(page: params[:page], per_page: 2)
  end
  def new
    @company = Company.new
  end
  def show; end
  def edit; end

  def create
    @company = Company.new(company_params)
    @company.company = current_company
    @company.created_by = current_user

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: created_msg }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
=begin
  rescue
    redirect_to new_company_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
=end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: updated_msg }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  rescue
    redirect_to edit_company_url, alert: I18n.t("errors.rescue.fields"), class: 'alert'
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: destroyed_msg }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

=begin
  def set_city
    state = State.select(:id).where(acronym: ["SC", "PR"])
    @cities = City.where(state_id: state)
    @states = State.where(acronym: ["SC","PR"])
  end
=end

    def get_city
      @states = State.where(acronym: ["SC", "PR"])
      state = State.select(:id).where(acronym: ["SC", "PR"])

      @cities = City.where(state_id: state)
    end
    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :company_type, :cnpj, :phone, :address, :number, :zipcode, :district, :city_id)
    end
end
