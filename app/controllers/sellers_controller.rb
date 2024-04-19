class SellersController < ApplicationController
  before_action :set_seller, except: %i[index new]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @sellers = policy_scope(Seller)
    @sellers = Seller.all
    if params[:query].present?
      sql_subquery = <<~SQL
        sellers.seller_name ILIKE :query
        OR products.product_name ILIKE :query
      SQL
      @sellers = @sellers.joins(:products).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    authorize @seller
  end

  def new
    @seller = Seller.new
    authorize @seller
  end

  def create
    @seller = Seller.new(seller_strong_params)
    authorize @seller
    if @seller.save
      redirect_to root_path, notice: 'New seller page successfully created'
    else
      render :new, status: :unprocessable_entity, notice: 'Error - please try again'
    end
  end

  def edit
    authorize @seller
  end

  def update
    authorize @seller
    if @seller.update(seller_strong_params)
      redirect_to root_path, notice: 'Seller details successfully updated'
    else
      render :edit, status: :unprocessable_entity, notice: 'Error - please try again'
    end
  end

  def destroy
    authorize @seller
    @seller.destroy
    redirect_to root_path, status: :see_other, notice: 'Seller account has been deleted'
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
    @seller.user = current_user
  end

  def seller_strong_params
    params.require(:seller).permit(:seller_name, :description, :email, :website, :social_media_link, :phone_number, :address, :opening_time, :closing_time, photos: [])
  end
end
