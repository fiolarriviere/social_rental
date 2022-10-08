class ReviewsController < ApplicationController
  before_action :set_place, only: %i[new create]
  before_action :set_review, only: %i[edit update destroy]

  def new
    # We need @place in our `simple_form_for`
    @place = Place.find(params[:place_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.place = @place
    if @review.save
    redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to place_path(@review.place), status: :see_other
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
