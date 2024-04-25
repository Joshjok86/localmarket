class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_seller_review, except: %i[show]

  def show
    @reviews = Review.all(params[:id])
    @seller = @review.seller
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_strong_params)
    @review.seller = @seller
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to root_path, notice: "Review submitted successfully"
    else
      render :new, status: :unprocessable_entity, notice: "Error, please try again"
    end
  end

  def destroy
    authorize @review
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to root_path, status: :see_other, notice: "Review deleted"
    else
      render :show, status: :unprocessable_entity, notice: "Error - unable to delete review at this time"
    end
  end

  private

  def review_strong_params
    params.require(:review).permit(:content, :title, :rating, photos: [])
  end

  def set_seller_review
    @seller = Seller.find(params[:seller_id])
  end
end
