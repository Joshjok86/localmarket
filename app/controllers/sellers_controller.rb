class SellersController < ApplicationController
  before_action :set_seller, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @sellers = Seller.all
  end

  def show
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_strong_params)
    @seller.user = current_user
    if @seller.save
      redirect_to root_path, notice: 'New seller page successfully created'
    else
      render :new, status: :unprocessable_entity, notice: 'Error - please try again'
    end
  end

  def edit
  end

  def update
    if @seller.update(seller_strong_params)
      redirect_to root_path, notice: 'Seller details successfully updated'
    else
      render :edit, status: :unprocessable_entity, notice: 'Error - please try again'
    end
  end

  def destroy
    @seller.destroy
    redirect_to root_path, status: :see_other, notice: 'Seller account has been deleted'
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_strong_params
    params.require(:seller).permit(:seller_name, :description, :email, :website, :social_media_link, :phone_number, :address, :opening_time, :closing_time, photos: [])
  end
end
