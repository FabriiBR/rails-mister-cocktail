class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]

  def index
    @reviews = Reviews.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:content, :name)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
