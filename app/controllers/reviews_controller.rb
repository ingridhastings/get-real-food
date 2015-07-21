class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_review, only: [:edit, :update, :destroy]

	def edit
		@farm = @review.farm
	end

	def create
		@review = current_user.reviews.new(review_params)

		if @review.save
			redirect_to farm_path(@review.farm), notice: 'Review was successfully created.'
		else
			redirect_to farm_path(@review.farm), notice: "Something went wrong"
		end
	end

	def update
		if @review.update(review_params)
			redirect_to farm_path(@review.farm), notice: 'Review was successfully updated.'
		else
			redirect_to farm_path(@review.farm), notice: "Something went wrong"
		end
	end

	def destroy
		@review.destroy
		redirect_to farm_path(@review.farm), notice: 'Review was successfully destroyed.'
	end

	private

	def set_review
		@review = Review.find(params[:id])
	end

	def review_params
		params.require(:review).permit(:content, :farm_id, :score)
	end
end