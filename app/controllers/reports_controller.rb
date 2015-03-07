class ReportsController < ApplicationController
  def index
    @bill_total_amount = Bill.total_amount current_company
    @order_total_amount = Order.total_amount current_company
    @order_total_commission_charge = Order.total_commission_charge current_company

    @earnings = @order_total_amount - @order_total_commission_charge - @bill_total_amount

    @bills = Bill.where(company: current_company)
    @orders = Order.where(company: current_company)
    @products = Product.where(company: current_company)
  end
end
