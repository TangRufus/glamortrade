class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]

  # GET /bills
  # GET /bills.json
  def index
    @bills = policy_scope(Bill)
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill_form.submit(bill_params)

    respond_to do |format|
      if @bill_form.save
        format.html { redirect_to bills_path, notice: "Bill: #{@bill_form.title} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    @bill_form.submit(bill_params)

    respond_to do |format|
      if @bill_form.save
        format.html { redirect_to bills_path, notice: "Bill: #{@bill_form.title} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
      authorize @bill
    end

    def create_new_form
      bill = Bill.new
      authorize bill
      @bill_form = BillForm.new(bill)
    end

    def create_edit_form
      @bill_form = BillForm.new(@bill)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(*policy(@bill || Bill).permitted_attributes)
    end
  end
