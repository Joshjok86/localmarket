class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_seller
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = policy_scope(Product)
  end

  def show
    @product.seller = @seller
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_strong_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to root_path, notice: 'New product successfully listed'
    else
      render :new, status: :unprocessable_entity, notice: 'Error - please try again'
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    if @product.update(product_strong_params)
      redirect_to root_path, notice: 'Product details successfully updated'
    else
      render :edit, status: :unprocessable_entity, notice: 'Error - please try again'
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to root_path, status: :see_other, notice: 'Product has been removed from your listings'
  end

  private

  def product_strong_params
    params.require(:product).permit(:seller_id, :product_name, :description, :price, :quantity)
  end

  def set_seller
    @seller = Seller.find(params[:seller_id])
    @product.seller = @seller
    @product.seller.user = current_user
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
