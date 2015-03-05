class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company_form.submit(company_params)

    respond_to do |format|
      if @company_form.save
        format.html { redirect_to @company_form, notice: "Company: #{@company_form.name} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company_form.submit(company_params)

    respond_to do |format|
      if @company_form.save
        format.html { redirect_to @company_form, notice: "Company: #{@company_form.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    name = @company.name
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company: #{name} was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def create_new_form
      company = Company.new
      @company_form = CompanyForm.new(company)
    end

    def create_edit_form
      @company_form = CompanyForm.new(@company)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :domain_url, :low_stock_contact_email, :out_of_stock_contact_email, :delivery_contact_email)
    end
  end
