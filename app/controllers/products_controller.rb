class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]

  # GET /products
  # GET /products.json
  def index
    @products = policy_scope(Product)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product_form.submit(product_params)

    respond_to do |format|
      if @product_form.save
        format.html { redirect_to @product_form, notice: "Product: #{@product_form.name} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product_form.submit(product_params)

    respond_to do |format|
      if @product_form.save
        format.html { redirect_to @product_form, notice: "Product: #{@product_form.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    name = @product.name
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product: #{name} was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      # authorize @product
    end

    def create_new_form
      product = current_company.products.new
      # authorize product
      @product_form = ProductForm.new(product)
    end

    def create_edit_form
      @product_form = ProductForm.new(@product)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(*policy(@product || Product).permitted_attributes)
    end
  end

