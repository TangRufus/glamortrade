class OrdersController < ApplicationController
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]

  # GET /orders
  # GET /orders.json
  def index
    @orders = policy_scope(Order)
  end

  # GET /orders/new
  def new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order_form.submit(order_params)

    respond_to do |format|
      if @order_form.save
        format.html { redirect_to orders_path notice: "Order was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def create_new_form
      order = Order.new
      authorize order
      @order_form = OrderForm.new(order)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(*policy(@order || Order).permitted_attributes)
    end
  end

